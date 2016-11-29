class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.integer :kind
      t.text :description
      t.boolean :active

      t.timestamps null: false
    end
  end
end
