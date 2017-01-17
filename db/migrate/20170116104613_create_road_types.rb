class CreateRoadTypes < ActiveRecord::Migration
  def change
    create_table :road_types do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
    add_index :road_types, :name, unique: true
    add_index :road_types, :code, unique: true
  end
end
