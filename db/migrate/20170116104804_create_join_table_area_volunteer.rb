class CreateJoinTableAreaVolunteer < ActiveRecord::Migration
  def change
    create_join_table :areas, :volunteers do |t|
      t.index [:area_id, :volunteer_id]
      t.index [:volunteer_id, :area_id]
    end
  end
end
