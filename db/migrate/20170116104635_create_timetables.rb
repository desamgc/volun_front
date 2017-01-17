class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.references :event, index: true, foreign_key: true
      t.date :execution_date
      t.string :start_hour
      t.string :end_hour

      t.timestamps null: false
    end
  end
end
