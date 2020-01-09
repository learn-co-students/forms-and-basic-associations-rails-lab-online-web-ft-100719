class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }
  # Will generate a param that looks like
  # { song => { title: ..., artist_id: ..., genre_id: ..., 
  #   notes_attributes: [{content: ... }, {content: ...}, etc.]}}
  # When used in create, it will create the song, and ALSO create the notes using notes_attributes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
