require 'rails_helper'

RSpec.feature "user creates a student" do
  scenario "by completing the new student form" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.create(:student)
    enrollment = FactoryGirl.create(:enrollment, group: group, student: student)
    guardian = FactoryGirl.attributes_for(:guardian)

    visit student_path(student)
    find(".btn-large").click

    expect(current_path).to eq(new_guardian_path)

    fill_in "First name", with: guardian[:first_name]
    fill_in "Last name", with: guardian[:last_name]
    fill_in "contact_phone_number", with: "555-555-5555"
    find(:css, "#language-select").set("English")
    find(:css, "#relationship-select").set("Mother")
    find(:css, "#primary-contact").set(true)
    click_on "Create"

    expect(current_path).to eq(student_path(student))
    within ".collection-item" do
      expect(page).to have_content(guardian[:first_name])
      expect(page).to have_content(guardian[:last_name])
      expect(page).to have_content("555-555-5555")
      expect(page).to have_content("English")
      expect(page).to have_content("textsms")
    end
  end
end
