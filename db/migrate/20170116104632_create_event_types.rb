class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :event_types, :kind, unique: true
  end
end
