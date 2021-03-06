require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_info = filename.split(' - ')
    artist_name = song_info[0]
    song_name = song_info[1]
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name)
    song.artist = artist
    artist.songs << song
    song
  end
end
