class ChangeFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :earthquakes, :latitude, :float, using: 'latitude::float'
    change_column :earthquakes, :longitude, :float, using: 'latitude::float'
    change_column :earthquakes, :magnitude, :float, using: 'latitude::float'
    change_column :earthquakes, :depth, :integer, using: 'latitude::integer'
  end
end
