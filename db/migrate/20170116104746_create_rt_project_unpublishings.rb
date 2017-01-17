class CreateRtProjectUnpublishings < ActiveRecord::Migration
  def change
    create_table :rt_project_unpublishings do |t|
      t.text :reason

      t.timestamps null: false
    end
  end
end
