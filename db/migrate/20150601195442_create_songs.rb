class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :audio_url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
