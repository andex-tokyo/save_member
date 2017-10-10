require 'csv'
require 'fileutils'
require 'open-uri'

csv_data = 'alldata.csv'
puts "start..."

CSV.foreach(csv_data) do |data|
  name = data[1]
  team = data[0]
  url = data[2]
  fileName = "#{team}_#{name}.jpg"
  dirName = "mem_pic"
  filePath = "#{dirName}/#{fileName}"
  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)
  
  open(filePath, 'wb') do |output|
    open(url) do |image|
      output.write(image.read)
    end
    puts name
  end
end
puts "complete!"
