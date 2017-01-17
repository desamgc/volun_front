class CreatePtEntities < ActiveRecord::Migration
  def change
    create_table :pt_entities do |t|
      t.date :request_date
      t.text :request_description
      t.string :volunteers_profile
      t.text :activities
      t.date :sav_date
      t.integer :derived_volunteers_num
      t.integer :added_volunteers_num
      t.boolean :agreement_signed, default: false
      t.date :agreement_date
      t.boolean :prevailing, default: false

      t.timestamps null: false
    end
  end
end
