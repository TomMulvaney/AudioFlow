class CreateIntensities < ActiveRecord::Migration
  def change
    create_table :intensities do |t|
      t.string :name
      t.integer :value
      t.string :image_filename

      t.timestamps null: false
    end
  end
end
