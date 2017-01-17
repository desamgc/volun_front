class CreateRtVolunteerAmendments < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_amendments do |t|
      t.references :address, index: true, foreign_key: true
      t.string :phone_number
      t.string :phone_number_alt

      t.timestamps null: false
    end
  end
end
