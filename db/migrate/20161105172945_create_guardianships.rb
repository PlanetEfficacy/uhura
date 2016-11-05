class CreateGuardianships < ActiveRecord::Migration[5.0]
  def change
    create_table :guardianships do |t|
      t.references :student, foreign_key: true
      t.references :guardian, foreign_key: true

      t.timestamps
    end
  end
end
