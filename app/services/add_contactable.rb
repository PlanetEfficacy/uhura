class AddContactable
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def student_dropdown
    @user.students.order(:last_name).map do |student|
      ["#{student.last_name}, #{student.first_name}", student.id]
    end.uniq
  end

  def guardian_dropdown
    @result = []
    @user.students.map do |student|
      map_guardians(student)
    end
    @result.uniq.sort_by { |guardian| guardian[0] }
  end

  private

    def map_guardians(student)
      student.guardians.order(:last_name).each do |guardian|
        @result << ["#{guardian.last_name}, #{guardian.first_name}", guardian.id]
      end
    end
end
