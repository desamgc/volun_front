class CreateVolunAvailabilities < ActiveRecord::Migration
  def change
    create_table :volun_availabilities do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.string :day
      t.string :start_hour
      t.string :end_hour

      t.timestamps null: false
    end
  end
end
