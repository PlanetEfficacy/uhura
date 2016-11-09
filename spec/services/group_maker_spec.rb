require 'rails_helper'

RSpec.describe GroupMaker do
  it "can add students and guardians to a group from a csv" do
    group = FactoryGirl.create(:group)
    expect(group.students.count).to eq(0)

    file = File.new(Rails.root + "spec/fixtures/student_data.csv", "r")
    group_maker = GroupMaker.new(group, file)
    group_maker.create_students_and_guardians

    expect(group.students.count).to eq(2)
    expect(group.students.first.name).to eq("Jaime Lannister")
    expect(group.students.first.phone_number).to eq("555-555-5555")
    expect(group.students.first.language_code).to eq("en")
    expect(group.students.first.name).to eq("Luke Skywalker")
    expect(group.students.first.phone_number).to eq("555-555-5557")
    expect(group.students.first.language_code).to eq("cy")
    expect(group.students.first.primary_guardian.name).to eq("Tywin Lannister")
    expect(group.students.first.primary_guardian.phone_number).to eq("555-555-5556")
    expect(group.students.first.primary_guardian.language_code).to eq("en")
    expect(group.students.first.primary_guardian.relationship).to eq("Father")
    expect(group.students.second.primary_guardian.name).to eq("Darth Vader")
    expect(group.students.second.primary_guardian.phone_number).to eq("555-555-5558")
    expect(group.students.second.primary_guardian.language_code).to eq("pl")
    expect(group.students.second.primary_guardian.relationship).to eq("Father")
    expect(group_maker.success?).to eq(true)
  end
end
