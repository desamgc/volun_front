class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :project, index: true, foreign_key: true
      t.text :description
      t.string :hour

      t.timestamps null: false
    end
  end
end
