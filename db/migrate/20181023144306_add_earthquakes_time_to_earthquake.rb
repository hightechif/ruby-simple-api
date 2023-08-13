class AddEarthquakesTimeToEarthquake < ActiveRecord::Migration[5.2]
  def change
    add_column :earthquakes, :earthquake_time, :datetime
    remove_column :earthquakes, :date, :string
    remove_column :earthquakes, :time, :string
  end
end
