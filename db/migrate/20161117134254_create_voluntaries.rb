class CreateVoluntaries < ActiveRecord::Migration
  def change
    create_table :voluntaries do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
