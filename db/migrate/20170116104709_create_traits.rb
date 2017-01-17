class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :traits, :name, unique: true
  end
end
