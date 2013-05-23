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

task :fetchtimes do
  doc =  Nokogiri::HTML(open("http://lineup.lollapalooza.com/events/2013/08/03"))
    File.open("times.txt", "w+") do |file|
      doc.css(".ds-time-range").each do |blah|
        file.write(blah.text+"\n")
    end
  end
  doc =  Nokogiri::HTML(open("http://lineup.lollapalooza.com/events/2013/08/04"))
    File.open("times.txt", "a+") do |file|
      doc.css(".ds-time-range").each do |blah|
        file.write(blah.text+"\n")
    end
  end
  doc =  Nokogiri::HTML(open("http://lineup.lollapalooza.com/events/2013/08/05"))
    File.open("times.txt", "a+") do |file|
      doc.css(".ds-time-range").each do |blah|
        file.write(blah.text+"\n")
    end
  end
end