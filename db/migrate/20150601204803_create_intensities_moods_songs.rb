class CreateIntensitiesMoodsSongs < ActiveRecord::Migration
  def change
    create_table :intensities_moods_songs do |t|
      t.references :intensity, null: false
      t.references :mood, null: false
      t.references :song, null: false
      
      t.timestamps null: false
    end
  end
end
