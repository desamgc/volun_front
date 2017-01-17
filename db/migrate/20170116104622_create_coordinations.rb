class CreateCoordinations < ActiveRecord::Migration
  def change
    create_table :coordinations do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :coordinations, :name, unique: true
  end
end
