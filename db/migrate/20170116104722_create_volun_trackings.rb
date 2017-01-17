class CreateVolunTrackings < ActiveRecord::Migration
  def change
    create_table :volun_trackings do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :tracking_type, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :technician, index: true, foreign_key: true
      t.datetime :tracking_date
      t.text :comments

      t.timestamps null: false
    end
  end
end
