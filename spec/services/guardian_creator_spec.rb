require 'rails_helper'

RSpec.describe GuardianCreator do
  it "creates a guardian from params" do
    student = FactoryGirl.create(:student)

    params = {
      :student_id => student.id,
      :guardian => {
        :first_name => "Josefa",
        :last_name => "Renner"
      },
      :contact => {
        :phone_number => "555-555-5555",
      },
      :language_code => "es",
      :relationship => "Father",
      :primary_contact => "on"
    }

    guardian_creator = GuardianCreator.create(params)
    expect(guardian_creator.guardian.first_name).to eq("Josefa")
    expect(guardian_creator.guardian.last_name).to eq("Renner")
    expect(guardian_creator.success).to eq(true)
    expect(guardian_creator.student).to eq(student)
  end
end
