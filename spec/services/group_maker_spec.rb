require 'rails_helper'

RSpec.describe GroupMaker do
  it "can add students and guardians to a group from a csv" do
    group = FactoryGirl.create(:group)
    expect(group.students.count).to eq(0)

    file = File.new(Rails.root + "spec/fixtures/student_data.csv", "r")
    group_maker = GroupMaker.new(group, file)
    group_maker.create_students_and_guardians

    expect(group.students.count).to eq(2)

    jaime = group.students.find_by(first_name: "Jaime")
    expect(jaime.name).to eq("Jaime Lannister")
    expect(jaime.phone_number).to eq("555-555-5555")
    expect(jaime.language_code).to eq("en")

    luke = group.students.find_by(first_name: "Luke")
    expect(luke.name).to eq("Luke Skywalker")
    expect(luke.phone_number).to eq("555-555-5557")
    expect(luke.language_code).to eq("cy")

    tywin = jaime.primary_guardian
    expect(tywin.name).to eq("Tywin Lannister")
    expect(tywin.phone_number).to eq("555-555-5556")
    expect(tywin.language_code).to eq("en")
    expect(tywin.relationship_type).to eq("Father")

    vader = luke.primary_guardian
    expect(vader.name).to eq("Darth Vader")
    expect(vader.phone_number).to eq("555-555-5558")
    expect(vader.language_code).to eq("pl")
    expect(vader.relationship_type).to eq("Father")
  end
end
