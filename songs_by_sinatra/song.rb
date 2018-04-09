require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

# Song
class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :released_on, Date

  def released_on=date
    super Date.strptime(date, '%m/%d/%Y')
  end
end

# Helper
module SongHelpers
  def find_songs
    @songs = Song.all
  end

  def find_song
    Song.get(params[:id])
  end

  def create_song
    @song = Song.create(params[:song])
  end
end

helpers SongHelpers

DataMapper.finalize

get '/songs' do
  find_songs
  slim :songs
end

get '/songs/new' do
  protected!
  @song = Song.new
  slim :new_song
end

get '/songs/:id' do
  @song = find_song
  slim :song
end

post '/songs' do
  protected!
  flash[:notice] = 'Song successfully added' if create_song
  redirect to("/songs/#{@song.id}")
end

get '/songs/:id/edit' do
  protected!
  @song = find_song
  slim :edit_song
end

put '/songs/:id' do
  protected!
  song = find_song
  song.update(params[:song])
  flash[:notice] = 'Song successfully updated'
  redirect to("/songs/#{song.id}")
end

delete '/songs/:id' do
  protected!
  find_song.destroy
  redirect to('/songs')
end
