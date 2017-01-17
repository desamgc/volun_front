class CreateJoinTableCollectiveProject < ActiveRecord::Migration
  def change
    create_join_table :collectives, :projects do |t|
      t.index [:collective_id, :project_id]
      t.index [:project_id, :collective_id]
    end
  end
end
