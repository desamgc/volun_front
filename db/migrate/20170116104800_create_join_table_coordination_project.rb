class CreateJoinTableCoordinationProject < ActiveRecord::Migration
  def change
    create_join_table :coordinations, :projects do |t|
      t.index [:coordination_id, :project_id]
      t.index [:project_id, :coordination_id]
    end
  end
end
