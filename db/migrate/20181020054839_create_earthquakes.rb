class CreateEarthquakes < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquakes do |t|
      t.string :date
      t.string :time
      t.string :latitude
      t.string :longitude
      t.string :magnitude
      t.string :depth
      t.string :location

      t.timestamps
    end
  end
end
