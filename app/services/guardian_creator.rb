class GuardianCreator
  attr_reader :student,
              :params,
              :relationship,
              :guardian,
              :success

  def initialize(params)
    @params = params
    @relationship = get_relationship
    @student = Student.find(params[:student_id])
    @guardian = get_guardian
    Guardianship.create(student: student, guardian: guardian)
    guardian.contacts << get_contact
    @success = success?
  end

  def self.create(params)
    GuardianCreator.new(params)
  end

  private

    def success?
      guardian.class == Guardian
    end

    def get_contact
      Contact.find_or_create_by(phone_number: params[:contact][:phone_number])
    end

    def get_relationship
      Relationship.find_or_create_by(relationship: params[:relationship])
    end

    def get_guardian
      Guardian.find_or_create_by(
        first_name: params[:guardian][:first_name],
        last_name: params[:guardian][:last_name],
        language_code: params[:language_code],
        relationship_id: relationship.id,
        primary: primary?
      )
    end

    def primary?
      params[:primary_contact] == "on"
    end
end
