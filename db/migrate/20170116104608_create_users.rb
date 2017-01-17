class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :locale
      t.references :loggable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
