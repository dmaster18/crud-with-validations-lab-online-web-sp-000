class Song < ApplicationRecord
  validates :title, :artist_name, presence: true 
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year}, if released? == true
  
  def released?
    self.released == true
  end

  
  
end
