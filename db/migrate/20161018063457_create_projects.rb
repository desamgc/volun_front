class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :code
      t.string :name
      t.string :description
      t.date :registry_date
      t.date :start_date
      t.date :end_date
      t.string :city_hall
      t.string :important
      t.string :status
      t.string :assessment
      t.string :work_place
      t.string :manager
      t.string :manager_telf
      t.integer :voluntaries_num
      t.string :profile
      t.string :cooperation_agreement
      t.references :district, index: true, foreign_key: true
      t.references :proposal, index: true, foreign_key: true
      t.references :project_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
