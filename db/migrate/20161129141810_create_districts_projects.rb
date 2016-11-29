class CreateDistrictsProjects < ActiveRecord::Migration
  def change
    create_table :districts_projects do |t|
      t.references :district, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
