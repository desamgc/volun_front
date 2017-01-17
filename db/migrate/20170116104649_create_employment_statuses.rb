class CreateEmploymentStatuses < ActiveRecord::Migration
  def change
    create_table :employment_statuses do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :employment_statuses, :name, unique: true
  end
end
