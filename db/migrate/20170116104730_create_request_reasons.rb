class CreateRequestReasons < ActiveRecord::Migration
  def change
    create_table :request_reasons do |t|
      t.integer :kind
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :request_reasons, :kind, unique: true
  end
end
