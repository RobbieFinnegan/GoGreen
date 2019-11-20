class CreateGreenspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :greenspaces do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.boolean :gym
      t.boolean :dog
      t.boolean :parking
      t.boolean :bathroom

      t.timestamps
    end
  end
end
