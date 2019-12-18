class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, reject_if: lambda { |attributes| attributes[:content].blank? }, allow_destroy: true

  def artist_name
    artist.name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

end
