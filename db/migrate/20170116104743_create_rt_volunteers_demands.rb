class CreateRtVolunteersDemands < ActiveRecord::Migration
  def change
    create_table :rt_volunteers_demands do |t|
      t.text :description
      t.date :execution_start_date
      t.date :execution_end_date
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :town
      t.string :province
      t.string :requested_volunteers_num
      t.text :volunteers_profile
      t.text :volunteer_functions_1
      t.text :volunteer_functions_2
      t.text :volunteer_functions_3

      t.timestamps null: false
    end
  end
end
