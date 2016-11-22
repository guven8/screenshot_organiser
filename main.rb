require 'fileutils'
@screenshots = []
@desktop_path = '/users/Guven/Desktop'
@screenshots_folder = '/users/Guven/Documents/screenshots'

Dir.foreach(@desktop_path) do |item|
  if item.include? 'Screen Shot'
    @screenshots.push item
  end
end

screenshots_by_date = @screenshots.group_by { |i| i[12...21] }

unless File.directory?(@screenshots_folder)
  Dir.mkdir(@screenshots_folder)
end

screenshots_by_date.each do |date, files|
  date_folder = "#{@screenshots_folder}/#{date}"
  unless File.directory? date_folder
    Dir.mkdir date_folder
  end
  files.each do |file|
    FileUtils.mv("#{@desktop_path}/#{file}", "#{@screenshots_folder}/#{date}")
    puts "Moving #{file} to #{@screenshots_folder}/#{date}"
  end
end
