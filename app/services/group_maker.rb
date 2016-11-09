class GroupMaker
  require 'csv'

  attr_reader :group,
              :file

  def initialize(group, file)
    @group = group
    @file = file
  end

  def create_students_and_guardians
    CSV.foreach(file.path, headers: true) do |row|
      student = create_student(row)
      guardian = create_guardian(row)
      Guardianship.find_or_create_by(student: student, guardian: guardian)
      create_contacts(row, student: student, guardian: guardian)
      create_enrollment(student)
    end
  end

  private
    def create_student(row)
      student = Student.find_or_create_by(first_name: row["student first name"].capitalize,
                                          last_name: row["student last name"].capitalize,
                                          language_code: get_language(row["student language"]))
    end

    def create_guardian(row)
      relationship = create_relationship(row)
      guardian = Guardian.find_or_create_by(first_name: row["guardian first name"].capitalize,
                                            last_name: row["guardian last name"].capitalize,
                                            language_code: get_language(row["guardian language"]),
                                            relationship: relationship)
    end

    def create_contacts(row, contactables)
      create_contact(row["student phone number"], contactables[:student])
      create_contact(row["guardian phone number"], contactables[:guardian])
    end

    def create_contact(phone_number, contactable)
      Contact.find_or_create_by(phone_number: phone_number,
                                contactable: contactable)
    end

    def get_language(language)
      Languages.find_code(capitalize_or_default(language, "English"))
    end

    def create_relationship(row)
      relationship = capitalize_or_default(row["guardian relationship"], "Unknown")
      Relationship.find_or_create_by(relationship: relationship)
    end

    def capitalize_or_default(text, default)
      text ? text.capitalize : default
    end

    def create_enrollment(student)
      Enrollment.find_or_create_by(student: student, group: group)
    end
end
