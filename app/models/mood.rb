class Mood < ActiveRecord::Base
  has_many :intensities_moods_songs, dependent: :destroy
  has_many :intensities, through: :intensities_moods_songs
  has_many :songs, through: :intensities_moods_songs
end
