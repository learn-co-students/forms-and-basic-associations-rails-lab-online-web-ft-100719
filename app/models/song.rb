class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  accepts_nested_attributes_for :genre
  has_many :notes
  accepts_nested_attributes_for :notes
  
  def artist_name=(artist) 
    self.artist = Artist.find_or_create_by(name: artist)
  end 

  def artist_name 
    self.artist ? self.artist.name : nil
  end 

end
