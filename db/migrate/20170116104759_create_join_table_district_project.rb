class CreateJoinTableDistrictProject < ActiveRecord::Migration
  def change
    create_join_table :districts, :projects do |t|
      t.index [:district_id, :project_id]
      t.index [:project_id, :district_id]
    end
  end
end
