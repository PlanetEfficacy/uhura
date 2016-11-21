class Group < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments

  def names
    students.pluck "CONCAT(first_name, ' ', last_name)"
  end

  def student_message_count
    students.active.joins(:contacts).joins(:messages).count
  end

  def guardian_message_count
    students.active.map do |student|
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

  def enrollment_display_scale
    add_one_to_max(students.active.count, guardian_count)
  end

  def message_display_scale
    add_one_to_max(student_message_count, guardian_message_count)
  end

  def has_enrollment?
    students.active.count > 0
  end

  def has_message?
    student_message_count > 0 || guardian_message_count > 0
  end

  private
    def add_one_to_max(number_1, number_2)
      number_1 >= number_2 ? number_1 + 1 : number_2 + 1
    end
end
