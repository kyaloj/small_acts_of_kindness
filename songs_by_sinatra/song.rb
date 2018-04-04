require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

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

DataMapper.finalize

get('/songs/styles.css'){ scss :styles }

get '/songs' do
    @songs = Song.all
    slim :songs
end

get '/songs/new' do
    @song = Song.new
    slim :new_song
end

get '/songs/:id' do
    @song = Song.get(params[:id])
    slim :song
end
