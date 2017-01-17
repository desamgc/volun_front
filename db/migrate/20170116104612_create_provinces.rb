class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
    add_index :provinces, :name, unique: true
    add_index :provinces, :code, unique: true
  end
end
