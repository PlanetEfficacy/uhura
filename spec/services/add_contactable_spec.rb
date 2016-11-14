require 'rails_helper'

RSpec.describe AddContactable do
  it "can create an array of students from a current user" do
    user = FactoryGirl.create(:user)
    students = FactoryGirl.create_list(:student, 2)
    group = FactoryGirl.create(:group, user: user)
    FactoryGirl.create(:enrollment, group: group, student: students.first)

    add_student = AddContactable.new(user)

    expected = [["#{students.first.last_name}, #{students.first.first_name}",
                  students.first.id]]

    expect(add_student.student_dropdown).to eq(expected)
  end

  it "can create an array of guardians from a current user" do
    user = FactoryGirl.create(:user)
    students = FactoryGirl.create_list(:student, 2)
    group = FactoryGirl.create(:group, user: user)
    FactoryGirl.create(:enrollment, group: group, student: students.first)
    FactoryGirl.create(:enrollment, group: group, student: students.last)

    students.each do |student|
      guardians = FactoryGirl.create_list(:guardian, 2)
      FactoryGirl.create(:guardianship, guardian: guardians.first, student: student)
      FactoryGirl.create(:guardianship, guardian: guardians.last, student: student)
    end

    add_guardian = AddContactable.new(user)

    sorted = Guardian.order(:last_name)

    expected = [["#{sorted.first.last_name}, #{sorted.first.first_name}",
                  sorted.first.id],
                ["#{sorted.second.last_name}, #{sorted.second.first_name}",
                  sorted.second.id],
                ["#{sorted.third.last_name}, #{sorted.third.first_name}",
                  sorted.third.id],
                ["#{sorted.last.last_name}, #{sorted.last.first_name}",
                  sorted.last.id]]

    expect(add_guardian.guardian_dropdown).to eq(expected)
  end
end
