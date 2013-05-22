require 'bundler'
require 'open-uri'

Bundler.require

DataMapper.setup(:default, 'sqlite:///Users/merylcharleston/Documents/lollaproject/db/lolla.db')

class Band
  attr_accessor :name, :votes

  def initialize(band_name, votes = 0)
    self.name = band_name
    self.votes = votes
  end
end
# band = Band.new
# band.name = 'something'
# band.name
# => 'something'

DataMapper.finalize
DataMapper.auto_upgrade!
$bands = []
band_names = File.open("bands.txt").read.split("\n")
  band_names.each do |band_name|
    $bands << Band.new(band_name)
  end
get '/' do
  haml :index
  #"Hello, World!"
end

get '/:id/upvote' do
  x = params[:id].to_i
  "#{$band[x].votes}"
  #redirect '/'
end