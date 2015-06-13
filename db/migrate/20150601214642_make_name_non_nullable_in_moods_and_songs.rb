class MakeNameNonNullableInMoodsAndSongs < ActiveRecord::Migration
  def change
    change_column_null :moods, :name, false
    change_column_null :songs, :name, false
  end
end
