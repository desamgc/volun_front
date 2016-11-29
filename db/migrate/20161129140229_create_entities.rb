class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.references :entity_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
