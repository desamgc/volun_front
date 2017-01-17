class CreateTrackingTypes < ActiveRecord::Migration
  def change
    create_table :tracking_types do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :tracking_types, :name, unique: true
  end
end
