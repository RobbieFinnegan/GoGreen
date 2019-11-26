class AddCoordinatesToGreensapces < ActiveRecord::Migration[6.0]
  def change
    add_column :greensapces, :latitude, :float
    add_column :greensapces, :longitude, :float
  end
end
