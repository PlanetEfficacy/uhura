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
    students.map do |student|
      student.guardians.map do |guardian|
        guardian.messages.count
      end
    end.flatten.sum
  end

  def primary_guardian_names
    students.map { |student| student.primary_guardian.name }
  end
end
