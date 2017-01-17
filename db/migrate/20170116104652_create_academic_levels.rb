class CreateAcademicLevels < ActiveRecord::Migration
  def change
    create_table :academic_levels do |t|
      t.string :name
      t.string :educational_type
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :academic_levels, :name, unique: true
  end
end
