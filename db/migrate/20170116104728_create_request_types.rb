class CreateRequestTypes < ActiveRecord::Migration
  def change
    create_table :request_types do |t|
      t.integer :kind
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :request_types, :kind, unique: true
  end
end
