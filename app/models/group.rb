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
    primary_guardians.map { |primary_guardian| primary_guardian.name }
  end

  def guardian_count
    students.map { |student| student.guardians.count }.sum
  end

  def primary_guardians
    primary = students.order(:last_name).map { |student| student.primary_guardian }
    primary.all? { |guardian| guardian.nil? } ? [] : primary.compact
  end
end
