class CreateJoinTableProjectVolunteer < ActiveRecord::Migration
  def change
    create_join_table :projects, :volunteers do |t|
      t.index [:project_id, :volunteer_id]
      t.index [:volunteer_id, :project_id]
    end
  end
end
