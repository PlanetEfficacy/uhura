class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :group, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
