require 'bundler'
require 'open-uri'

Bundler.require

get '/' do
  doc =  Nokogiri::HTML(open("http://lineup.lollapalooza.com"))
  @blah = Array.new
  x = 0
  y = 0
  doc.css("a.band").each do |band|
    @blah[x]= band.text
    x = x + 1
  end
  @foo = Array.new
  doc.css("a.band").each do |band|
    @foo[y]= band
    y = y + 1
  end
  haml :index
  #"Hello, World!"
end