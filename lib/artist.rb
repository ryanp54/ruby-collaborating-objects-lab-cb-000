class Artist
  @@song_count = 0
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
      @name = name
      @songs = []
      self.save
  end

  def add_song(song)
    self.songs << song
    song.artist = self
    @@song_count += 1
  end

  def add_song_by_name(name)
    song = Song.new(name)
    self.add_song(song)
    song
  end

  def self.find_or_create_by_name(name)
    foc_artist = self.all.find{ |artist| artist.name == name }
    foc_artist = Artist.new(name) if !foc_artist
    foc_artist
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.song_count
    @@song_count
  end

end
