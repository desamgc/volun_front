class CreateMotivations < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.string :name
      t.string :active

      t.timestamps null: false
    end
  end
end
