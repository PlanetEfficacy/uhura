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

      binding.pry
    end
  end

  private
    def create_student(row)
      Student.find_or_create_by(first_name: row["student first name"].capitalize,
                                last_name: row["student last name"].capitalize,
                                language_code: get_language(row["student language"]))
    end

    def create_guardian(row)
      relationship = create_relationship(row)
      Guardian.find_or_create_by(first_name: row["guardian first name"].capitalize,
                                 last_name: row["guardian last name"].capitalize,
                                 language_code: get_language(row["guardian language"]),
                                 relationship: relationship)
    end

    def get_language(language)
      Languages.find_code(capitalize_or_default(language, "English"))
    end

    def create_relationship(row)
      relationship = capitalize_or_default(row["guardian relationship"], "Unknown")
      Relationship.find_or_create_by(type: relationship)
    end

    def capitalize_or_default(text, default)
      text ? text.capitalize : default
    end
end
