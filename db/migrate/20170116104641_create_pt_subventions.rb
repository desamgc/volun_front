class CreatePtSubventions < ActiveRecord::Migration
  def change
    create_table :pt_subventions do |t|
      t.string :representative_name
      t.string :representative_last_name
      t.string :representative_last_name_alt
      t.string :id_num
      t.string :vat_num
      t.boolean :entity_registry, default: false
      t.float :cost
      t.float :requested_amount
      t.float :subsidized_amount
      t.integer :initial_volunteers_num
      t.integer :participants_num
      t.boolean :has_quality_evaluation, default: false
      t.references :proposal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
