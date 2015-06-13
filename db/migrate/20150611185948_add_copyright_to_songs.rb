class AddCopyrightToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :copyright, :string, default: 'None', null: false
  end
end
