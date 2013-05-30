require 'nokogiri'
require 'open-uri'

task :fetchdata do
  doc =  Nokogiri::HTML(open("http://lineup.lollapalooza.com/"))
  File.open("bands.txt", "w+") do |file|
    doc.css("a.band").each do |blah|
      file.write(blah.text+",0\n")
    end
  end
end
