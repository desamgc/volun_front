class CreateRtEntitySubscribes < ActiveRecord::Migration
  def change
    create_table :rt_entity_subscribes do |t|
      t.string :name
      t.string :vat_num
      t.string :email
      t.string :contact_name
      t.string :contact_last_name
      t.string :contact_last_name_alt
      t.string :representative_name
      t.string :representative_last_name
      t.string :representative_last_name_alt
      t.string :phone_number
      t.string :phone_number_alt
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.string :town
      t.references :province, index: true, foreign_key: true
      t.references :request_reason, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
