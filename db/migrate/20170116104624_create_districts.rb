class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.string :code
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :districts, :name, unique: true
    add_index :districts, :code, unique: true
  end
end
