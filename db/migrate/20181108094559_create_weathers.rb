class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :location
      t.integer :code
      t.date :date
      t.integer :high
      t.integer :low
      t.string :level

      t.timestamps
    end
  end
end
