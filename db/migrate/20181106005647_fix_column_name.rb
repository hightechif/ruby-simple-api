class FixColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :news, :sumber, :source
  	rename_column :news, :location, :url  	
  end
end
