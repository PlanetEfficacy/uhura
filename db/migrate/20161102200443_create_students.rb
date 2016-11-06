class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :language_code
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
