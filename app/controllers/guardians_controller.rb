class GuardiansController < ApplicationController
  def new
    @guardian = Guardian.new
    @student_id = params[:student_id] if params[:student_id]
  end

  def create
    guardian_creator = GuardianCreator.create(params)
    if guardian_creator.success
      redirect_to student_path(guardian_creator.student)
    else
      # sad path
    end
    # @relationship = Relationship.find_or_create_by(relationship: params[:relationship])
    # @guardian = Guardian.new(guardian_params)
    # @guardian.relationship = @relationship
    # if @guardian.save!
    #   Guardianship.create(student: current_student, guardian: @guardian)
    #   @guardian.contacts << Contact.new(contact_params)
    #   redirect_to student_path(current_student)
    # else
    #   # sad path
    # end
  end

  def show
    @guardian = current_guardian
    @student_id = params[:student_id]
  end

  def destroy
    current_guardian.update(status: :inactive)
    redirect_to student_path(current_student)
  end

  def edit
    @guardian = current_guardian
  end

  def update
    Contactable.update(contactable: current_guardian,
                       contactable_params: guardian_params,
                       phone_number: contact_params[:phone_number])
    redirect_to current_guardian
  end

  private

  def guardian_params
    whitelist = params.require(:guardian).permit(:first_name, :last_name)
    whitelist["language_code"] = params[:language_code]
    whitelist["relationship_id"] = Relationship.find_or_create_by(relationship: params[:relationship]).id
    whitelist["primary"] = primary?
    return whitelist
  end

  def primary?
    params[:primary_contact] == "on"
  end

  def current_student
    Student.find(params[:student_id])
  end

  def current_guardian
    Guardian.find(params[:id])
  end
end
