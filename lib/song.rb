class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    puts filename + '!'
    artist = Artist.find_or_create_by_name(filename.split(/-/)[0].strip)
    print artist.name
    puts artist.add_song_by_name(filename.split(/-/)[1].strip)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
