class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :languages, :name, unique: true
  end
end
