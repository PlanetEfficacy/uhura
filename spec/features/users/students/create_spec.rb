require 'rails_helper'

RSpec.feature "user creates a student" do
  scenario "by completing the new student form" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.attributes_for(:student)

    visit group_path(group)
    find("a.btn-floating.btn-large.waves-effect.waves-light.amber.accent-2").click
    expect(current_path).to eq(new_student_path)

    fill_in "First name", with: student[:first_name]
    fill_in "Last name", with: student[:last_name]
    fill_in "contact_phone_number", with: "555-555-5555"
    find("option[value='es']").select_option

    click_on "Create"

    expect(current_path).to eq(group_path(group))
    within ".collection-item" do
      expect(current_path).to eq(group_path(group))
      expect(page).to have_content(student[:first_name])
      expect(page).to have_content(student[:last_name])
      expect(page).to have_content("555-555-5555")
      expect(page).to have_content("Spanish")
      expect(page).to have_content("textsms")
    end
  end
end
