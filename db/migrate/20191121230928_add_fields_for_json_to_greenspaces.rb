class AddFieldsForJsonToGreenspaces < ActiveRecord::Migration[6.0]
  def change
    add_column :greenspaces, :record_id, :string
    add_column :greenspaces, :lat, :float
    add_column :greenspaces, :lon, :float
    add_column :greenspaces, :surface, :float
    add_column :greenspaces, :perimeter, :float
  end
end
