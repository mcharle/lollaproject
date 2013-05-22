require 'bundler'
require 'open-uri'
require 'json'

Bundler.require

class Band
  attr_accessor :name, :votes

  def initialize(band_name, votes)
    self.name = band_name
    self.votes = votes
    #self.url = band_name.gsub(" ", "-")
  end
end
# band = Band.new
# band.name = 'something'
# band.name
# => 'something'

$bands = []



get '/style.css' do
  scss :style
end
get '/' do
  File.open("bands.txt").read.split("\n").each do |line|
  attributes = line.split(',')
  $bands << Band.new(attributes[0], attributes[1].to_i)
  $bands = $bands.sort_by{|b| b.name}.reverse
  $bands = $bands.sort_by{|b| b.votes}.reverse
end
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





