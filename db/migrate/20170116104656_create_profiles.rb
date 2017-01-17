class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :profiles, :name, unique: true
  end
end
