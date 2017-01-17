class CreateRtProjectUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rt_project_unsubscribes do |t|
      t.references :project, index: true, foreign_key: true
      t.text :reason

      t.timestamps null: false
    end
  end
end
