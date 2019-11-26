class AddCoordinatesToGreenspaces < ActiveRecord::Migration[6.0]
  def change
    add_column :greenspaces, :latitude, :float
  end
end
