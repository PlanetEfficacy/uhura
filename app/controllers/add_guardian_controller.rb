class AddGuardianController < ApplicationController
  def new
    @student = Student.find(params[:id])
  end

  def create
    guardian = Guardian.find(params[:guardian])
    student = Student.find(params[:id])
    Guardianship.find_or_create_by(student: student, guardian: guardian)
    redirect_to student_path(student)
  end
end
