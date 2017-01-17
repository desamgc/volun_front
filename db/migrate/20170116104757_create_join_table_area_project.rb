class CreateJoinTableAreaProject < ActiveRecord::Migration
  def change
    create_join_table :areas, :projects do |t|
      t.index [:area_id, :project_id]
      t.index [:project_id, :area_id]
    end
  end
end
