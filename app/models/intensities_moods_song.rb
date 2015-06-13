class IntensitiesMoodsSong < ActiveRecord::Base
  belongs_to :intensity
  belongs_to :mood
  belongs_to :song
end
