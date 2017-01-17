class CreateVolunAssessments < ActiveRecord::Migration
  def change
    create_table :volun_assessments do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :trait, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.string :trait_other
      t.boolean :assessment, default: false
      t.text :comments

      t.timestamps null: false
    end
  end
end
