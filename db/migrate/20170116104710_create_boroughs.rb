class CreateBoroughs < ActiveRecord::Migration
  def change
    create_table :boroughs do |t|
      t.string :name
      t.string :active
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
