class AddCordinatesToGreenspace < ActiveRecord::Migration[6.0]
  def change
    add_column :greenspaces, :latitude, :float
    add_column :greenspaces, :longitude, :float
  end
end
