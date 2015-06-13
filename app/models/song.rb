class Song < ActiveRecord::Base
  has_many :intensities_moods_songs, dependent: :destroy
  has_many :intensities, through: :intensities_moods_songs
  has_many :moods, through: :intensities_moods_songs
  
  validates_presence_of :name
end
