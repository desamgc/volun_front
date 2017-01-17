class CreateLanguageLevels < ActiveRecord::Migration
  def change
    create_table :language_levels do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :language_levels, :name, unique: true
  end
end
