class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string :name
      t.string :active

      t.timestamps null: false
    end
  end
end
