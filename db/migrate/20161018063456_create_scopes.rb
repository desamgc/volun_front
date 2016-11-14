class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
