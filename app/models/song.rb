class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes
end
def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end

def artist_name
   self.artist ? self.artist.name : nil
end

def genre_id=(id)
  self.genre = Genre.find_or_create_by(id: id)
end

def genre_id
   self.genre ? self.genre.id : nil
end

def notes_attributes=(attributes)
  attributes.each do |attribute|
    if attribute!=""
      note = Note.find_or_create_by(content: attribute)
      self.notes << note
    end
  end
end



end