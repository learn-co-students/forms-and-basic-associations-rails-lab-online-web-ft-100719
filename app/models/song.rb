class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def notes_content=(note_content_array)
    note_content_array.each do |note_content|
      self.notes.build(content: note_content)
    end
  end
end
