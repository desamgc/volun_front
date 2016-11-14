class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.text :comments
      t.date :registry_date
      t.date :approval_date

      t.timestamps null: false
    end
  end
end
