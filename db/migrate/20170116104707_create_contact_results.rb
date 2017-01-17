class CreateContactResults < ActiveRecord::Migration
  def change
    create_table :contact_results do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :contact_results, :name, unique: true
  end
end
