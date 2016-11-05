class CreateGuardians < ActiveRecord::Migration[5.0]
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.string :language_code
      t.boolean :primary, default: true
      t.references :relationship, foreign_key: true

      t.timestamps
    end
  end
end
