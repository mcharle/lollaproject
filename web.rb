require 'bundler'
require 'open-uri'
require 'json'

Bundler.require

class Band
  attr_accessor :name, :votes, :time

  def initialize(band_name, votes, playtime)
    self.name = band_name
    self.votes = votes
    self.time = playtime
    #self.url = band_name.gsub(" ", "-")
  end
end
# band = Band.new
# band.name = 'something'
# band.name
# => 'something'

$bands = []
$times = []
x = 0

File.open("times.txt").read.split("\n").each do |line|
  $times[x] = line
  x+=1
end

get '/style.css' do
  scss :style
end

get '/' do
  x = 0
  File.open("bands.txt").read.split("\n").each do |line|
    attributes = line.split(',')
    $bands << Band.new(attributes[0], attributes[1].to_i, $times[x])
    x+=1
  end
  $bands = $bands.sort_by{|b| b.name}.reverse
  $bands = $bands.sort_by{|b| b.votes}.reverse
  haml :index
  #"Hello, World!"
end

post '/vote' do
  content_type :json

  band_name = params[:band_name]

  vote(band_name).to_json
end


get '/info' do
  haml :info
end

get '/band/:bandName' do
  @nameOfBand = params[:bandName].gsub("_", " ")
  haml :band
end

def vote(band_name)
  bands_text = File.open('bands.txt').read

  updated_votes_count = nil

  updated_bands_text = bands_text.gsub(/(#{band_name}),(\d+)/) do |match|
    updated_votes_count = ($2.to_i) + 1

    "#{$1},#{updated_votes_count}"
  end

  File.open('bands.txt', 'w+') {|file| file.write(updated_bands_text)}

  { votes: updated_votes_count }
end





