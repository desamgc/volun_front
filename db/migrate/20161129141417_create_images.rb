class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.binary :payload
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
