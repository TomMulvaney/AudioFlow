class MakeValueNonNullableInIntensities < ActiveRecord::Migration
  def change
    change_column_null :intensities, :value, false
  end
end
