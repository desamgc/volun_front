class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.text :comments
      t.datetime :start_date
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
