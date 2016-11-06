require 'rails_helper'

RSpec.feature "user deletes a student" do
  scenario "by clicking the delete button" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.create(:student)
    enrollment = FactoryGirl.create(:enrollment, student: student, group: group)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit student_path(student)

    find("#delete").click
    find("#confirm-delete").click

    expect(current_path).to eq(group_path(group))
    expect(page).to_not have_css("div.card")
  end
end
