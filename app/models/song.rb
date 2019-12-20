class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end

  # def notes_attributes=(notes_attributes)
  #   notes_attributes.each do |i, note_attributes|
  #     self.notes.build(note_attributes)
  #   end
  # end

end
