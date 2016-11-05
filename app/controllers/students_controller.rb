class StudentsController < ApplicationController
  def new
    @student = Student.new
    @group_id = params[:group_id] if params[:group_id]
  end

  def create
    @student = Student.new(student_params)
    if @student.save!
      Enrollment.create(group: current_group, student: @student)
      @student.contacts << Contact.new(contact_params)
      redirect_to group_path(current_group)
    else
      # render :new
    end
  end

  def index
    # @students =
  end

  def show
    @student = current_student
  end

  private

    def student_params
      whitelist = params.require(:student).permit(:first_name, :last_name)
      whitelist["language_code"] = params[:language_code]
      return whitelist
    end

    def current_group
      Group.find(params[:group_id])
    end

    def current_student
      Student.find(params[:id])
    end

end
