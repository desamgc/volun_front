class CreateVolunContacts < ActiveRecord::Migration
  def change
    create_table :volun_contacts do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :contact_result, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :technician, index: true, foreign_key: true
      t.references :contact_type, index: true, foreign_key: true
      t.datetime :contact_date
      t.text :comments

      t.timestamps null: false
    end
  end
end
