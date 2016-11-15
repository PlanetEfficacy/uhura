class AddStudentController < ApplicationController
  def new
    @group = Group.find(params[:id])
  end

  def create
    student = Student.find(params[:student])
    student.update(status: :active)
    group = Group.find(params[:id])
    Enrollment.find_or_create_by(student: student, group: group)
    redirect_to group_path(group)
  end
end
