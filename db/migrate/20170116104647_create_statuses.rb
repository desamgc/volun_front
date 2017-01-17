class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :statuses, :name, unique: true
  end
end
