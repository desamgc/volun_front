class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :knowledges, :name, unique: true
  end
end
