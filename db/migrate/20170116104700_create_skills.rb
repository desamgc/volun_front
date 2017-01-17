class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :skills, :name, unique: true
  end
end
