class AddStudent
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def dropdown
    @user.students.order(:last_name).map do |student|
      ["#{student.last_name}, #{student.first_name}", student.id]
    end
  end
end
