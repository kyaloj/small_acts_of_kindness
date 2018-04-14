require 'sinatra/base'
require 'dm-core'
require 'dm-migrations'
require 'slim'
require 'sass'
require 'sinatra/flash'
require './sinatra/auth'

# Song
class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :released_on, Date
  property :likes, Integer, default: 0

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

class SongController < Sinatra::Base
  enable :method_override

  helpers SongHelpers

  configure :development do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
  end

  before do
    set_title
  end
  
  def css(*stylesheets)
    stylesheets.map do |stylesheet|
      "<link href=\"/#{stylesheet}.css\" media=\"screen, projection\" rel=\"stylesheet\" />"
    end.join
  end
  
  def current?(path='/')
    (request.path==path || request.path==path+'/') ? "current" : nil
  end
  
  def set_title
    @title ||= "Songs By Sinatra"
  end

  DataMapper.finalize

  get '/' do
    find_songs
    slim :songs
  end

  get '/new' do
    protected!
    @song = Song.new
    slim :new_song
  end

  get '/:id' do
    @song = find_song
    slim :song
  end

  post '/' do
    protected!
    flash[:notice] = 'Song successfully added' if create_song
    redirect to("/#{@song.id}")
  end

  get '/:id/edit' do
    protected!
    @song = find_song
    slim :edit_song
  end

  put '/:id' do
    protected!
    song = find_song
    song.update(params[:song])
    flash[:notice] = 'Song successfully updated'
    redirect to("/songs/#{song.id}")
  end

  delete '/:id' do
    protected!
    find_song.destroy
    redirect to('/songs')
  end

  post '/:id/like' do
    @song = find_song
    @song.likes = @song.likes.next
    @song.save
    redirect to "/songs/#{@song.id}" unless request.xhr?
    slim :like, layout: false
  end
end