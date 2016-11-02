class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save!
      redirect_to groups_path
    else
      # render :new
    end
  end

  private

  def student_params
    params.require(:group).permit(:first_name, :last_name, :language_code)
  end
end
