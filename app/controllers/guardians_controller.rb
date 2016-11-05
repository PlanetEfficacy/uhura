class GuardiansController < ApplicationController
  def new
    @guardian = Guardian.new
    @student_id = params[:student_id] if params[:student_id]
  end

  def create
    @relationship = Relationship.find_or_create_by(relationship: params[:relationship])
    @guardian = Guardian.new(guardian_params)
    @guardian.relationship = @relationship
    if @guardian.save!
      Guardianship.create(student: current_student, guardian: @guardian)
      @guardian.contacts << Contact.new(contact_params)
      redirect_to student_path(current_student)
    else
      # sad path
    end
  end

  private

  def guardian_params
    whitelist = params.require(:guardian).permit(:first_name, :last_name)
    whitelist["language_code"] = params[:language_code]
    whitelist["primary"] = primary?
    return whitelist
  end

  def primary?
    params[:primary_contact] == "on"
  end

  def current_student
    Student.find(params[:student_id])
  end
end
