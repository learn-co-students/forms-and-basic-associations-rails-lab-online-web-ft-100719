class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes
  accepts_nested_attributes_for :notes, reject_if: :all_blank

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
    self.genre ? self.genre.name : nil
  end 

  # def notes_attributes=(notes)
  #   notes.each do |content| 
  #     note = self.notes.build(content: content) unless content.empty?
  #   end 
  # end 

  # def notes_attributes 
  #   notes.collect {|note| note.content}
  # end 
end
