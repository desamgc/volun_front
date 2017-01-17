class CreateRtVolunteerUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_unsubscribes do |t|
      t.integer :level
      t.text :reason

      t.timestamps null: false
    end
  end
end
