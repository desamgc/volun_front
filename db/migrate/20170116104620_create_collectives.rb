class CreateCollectives < ActiveRecord::Migration
  def change
    create_table :collectives do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :collectives, :name, unique: true
  end
end
