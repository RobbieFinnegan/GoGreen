class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :greenspaces, :lat, :latitude
    p 'hi rob'
    rename_column :greenspaces, :lon, :longitude

  end
end
