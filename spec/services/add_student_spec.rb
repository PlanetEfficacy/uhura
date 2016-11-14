require 'rails_helper'

RSpec.describe AddStudent do
  it "can create an array of students from a current user" do
    user = FactoryGirl.create(:user)
    students = FactoryGirl.create_list(:student, 2)
    group = FactoryGirl.create(:group, user: user)
    FactoryGirl.create(:enrollment, group: group, student: students.first)

    add_student = AddStudent.new(user)

    expected = [["#{students.first.last_name}, #{students.first.first_name}",
                  students.first.id]]

    expect(add_student.dropdown).to eq(expected)
  end
end
