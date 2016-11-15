require 'rails_helper'

RSpec.feature "user deletes a student and then adds the student back to their group" do
  scenario "the student's info is visible on the group page" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.create(:student, status: 0)
    enrollment = FactoryGirl.create(:enrollment, student: student, group: group)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_add_student_path(group)

    find("#student-select").find("option[value='#{student.id}']").select_option
    click_on "Add"

    expect(current_path).to eq(group_path(group))
    within "li.collection-item" do
      expect(page).to have_content(student.name)
      expect(page).to have_content(student.phone_number)
      expect(page).to have_content(student.language)
    end
  end
end
