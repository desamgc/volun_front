class CreateProjectScopes < ActiveRecord::Migration
  def change
    create_table :project_scopes do |t|
      t.references :project, index: true, foreign_key: true
      t.references :scope, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
