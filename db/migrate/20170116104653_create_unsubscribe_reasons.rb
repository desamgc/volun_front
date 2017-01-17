class CreateUnsubscribeReasons < ActiveRecord::Migration
  def change
    create_table :unsubscribe_reasons do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :unsubscribe_reasons, :name, unique: true
  end
end
