require 'rails_helper'

RSpec.feature "user adds a preexisting student to a group" do
  scenario "by selecting that student from a drop down" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    group_1 = FactoryGirl.create(:group, user: user)
    group_2 = FactoryGirl.create(:group, user: user)

    student = FactoryGirl.create(:student)
    FactoryGirl.create(:enrollment, student: student, group: group_1)

    visit group_path(group_2)
    find("#add-existing-student").click

    find("#student-select").find("option[value='#{student.id}']").select_option
    click_on "Add"

    expect(current_path).to eq(group_path(group_2))
    within "li.collection-item" do
      expect(page).to have_content(student.name)
      expect(page).to have_content(student.phone_number)
      expect(page).to have_content(student.language)
    end
  end
end
