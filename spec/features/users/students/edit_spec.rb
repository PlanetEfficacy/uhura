require 'rails_helper'

RSpec.feature "user edits a student" do
  scenario "by completing the edit student form" do
    user = FactoryGirl.create(:user)
    student = FactoryGirl.create(:student)
    contact = FactoryGirl.create(:contact, contactable: student)
    group = FactoryGirl.create(:group, user: user)
    FactoryGirl.create(:enrollment, group: group, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit student_path(student)

    find("#edit").click
    expect(current_path).to eq(edit_student_path(student))

    fill_in "First name", with: "Luke"
    fill_in "Last name", with: "Skywalker"
    fill_in "contact_phone_number", with: "123-456-7891"
    find("option[value='es']").select_option

    click_on "Update"

    expect(current_path).to eq(student_path(student))

    within "div.card" do
      expect(page).to have_content("Luke Skywalker")
      expect(page).to have_content("123-456-7891")
      expect(page).to have_content("Spanish")
    end
  end
end
