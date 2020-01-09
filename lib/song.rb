require "pry"

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end 
  
  def self.new_by_name(song_name) 
   new_song  = self.create
   new_song.name = song_name
   new_song
  end 
  
  def self.create_by_name(song_name) 
   new_song  = self.create
   new_song.name = song_name
   new_song
  end 
  
  def self.find_by_name(song_name)
    @@all.find{|x| x.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    @@all.sort_by do |object|
      object.name
    end
  end 
  
  def self.new_from_filename(file_name)
    song_array = file_name.split("-") 
    song1 = self.create
    song1.name =  song_array[0].strip.to_s
    song1.artist_name =  song_array[1].strip.split(".")[0].to_s
  end
  
  def self.destroy_all 
    @@all.clear
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end 

end

