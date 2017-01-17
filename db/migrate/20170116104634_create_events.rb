class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :eventable, polymorphic: true, index: true
      t.references :event_type, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
