class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :sumber
      t.string :image
      t.string :content
      t.string :location

      t.timestamps
    end
  end
end
