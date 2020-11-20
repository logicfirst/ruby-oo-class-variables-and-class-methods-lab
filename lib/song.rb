require 'pry'

class Song

  @@all = []
  @@count = 0
  @@genres = []
  @@artists = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    self.class.all << self
    @@count += 1
    @@genres << self.genre
    @@artists << self.artist
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def self.genre_count
    genre_hist = @@genres.each_with_object(Hash.new) do |genre, new_hash|
      if new_hash[genre]
        new_hash[genre] += 1
      else
        new_hash[genre] = 1
      end
    end
    genre_hist
  end

  def self.artist_count
    artist_hist = @@artists.each_with_object(Hash.new) do |artist, new_hash|
      if new_hash[artist] 
        new_hash[artist] += 1
      else 
        new_hash[artist] = 1
      end
    end
    artist_hist
  end
end

# binding.pry
# 0