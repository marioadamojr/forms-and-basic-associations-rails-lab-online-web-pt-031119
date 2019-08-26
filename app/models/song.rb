class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(a_name)
    artist = Artist.find_or_create_by(name: a_name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(g_name)
    genre = Genre.find_or_create_by(name: g_name)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(s_notes)
      s_notes.each do |content|
        note = self.notes.build(content:content) unless content.empty?
      end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
