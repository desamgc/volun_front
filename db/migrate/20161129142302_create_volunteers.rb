class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :first_surname
      t.string :second_surname
      t.integer :age
      t.string :id_number

      t.timestamps null: false
    end
  end
end
