class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :road_type, index: true, foreign_key: true
      t.string :road_name
      t.string :road_number_type
      t.string :road_number
      t.string :grader
      t.string :stairs
      t.string :floor
      t.string :door
      t.string :postal_code
      t.string :borough
      t.string :town
      t.references :province, index: true, foreign_key: true
      t.string :country
      t.string :ndp_code
      t.string :local_code
      t.string :class_name
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
