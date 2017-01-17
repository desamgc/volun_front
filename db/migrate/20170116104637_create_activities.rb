class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.text :transport
      t.string :pdf_url
      t.references :entity, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.boolean :share, default: false

      t.timestamps null: false
    end
    add_index :activities, :name, unique: true
  end
end
