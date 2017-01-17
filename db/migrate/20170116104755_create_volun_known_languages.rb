class CreateVolunKnownLanguages < ActiveRecord::Migration
  def change
    create_table :volun_known_languages do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.references :language_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
