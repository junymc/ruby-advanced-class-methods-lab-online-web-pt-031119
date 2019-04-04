require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song_name| song_name.name}
  end

  def self.new_from_filename(file_name)
    string = []
    string << file_name.split(/[-,.]/)
    string[2].delete
    binding.pry
  end

  def self.create_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end



end
