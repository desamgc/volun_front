class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :description
      t.integer :kind
      t.references :linkable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :links, :kind, unique: true
  end
end
