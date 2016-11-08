class Group < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments

  def names
    students.pluck "CONCAT(first_name, ' ', last_name)"
  end

  def student_message_count
    students.joins(:contacts).joins(:messages).count
  end

  def guardian_message_count
    # binding.pry
  end
end
