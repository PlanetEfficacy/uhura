class AddSchoolToStudent < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :school, foreign_key: true
  end
end
