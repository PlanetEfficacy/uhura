require 'rails_helper'

RSpec.feature "user deletes a guardian" do
  scenario "by clicking the delete button" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.create(:student)
    enrollment = FactoryGirl.create(:enrollment, student: student, group: group)
    guardian = FactoryGirl.create(:guardian)
    guardianship = FactoryGirl.create(:guardianship, guardian: guardian, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit guardian_path(guardian)
    visit guardian_path(guardian, student_id: student.id)
    expect(page).to have_css("li.collection-item", count: 1)

    find("#delete").click
    find("#confirm-delete").click

    expect(current_path).to eq(student_path(student))
    expect(page).to_not have_css("li.collection-item")
  end
end
