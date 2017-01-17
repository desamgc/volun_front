class CreateJoinTableDegreeVolunteer < ActiveRecord::Migration
  def change
    create_join_table :degrees, :volunteers do |t|
      t.index [:degree_id, :volunteer_id]
      t.index [:volunteer_id, :degree_id]
    end
  end
end
