class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :degrees, :name, unique: true
  end
end
