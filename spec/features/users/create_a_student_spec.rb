require 'rails_helper'

RSpec.feature "user creates a student" do
  scenario "by completing the new student form" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    student = FactoryGirl.attributes_for(:student)

    visit root_path
    find("#new-student").click
    expect(current_path).to eq(new_student_path)

    fill_in "First name", with: student.first_name #{ Faker::Name.first_name }
    fill_in "Last name", with: student.last_name # { Faker::Name.last_name }
    fill_in "Phone number", with: student.phone_number #{ Faker::PhoneNumber.cell_phone }
    select "English", from: "languageSelect"

    click_on "Create"
    within ".card.student" do
      expect(current_path).to eq(group_path(group))
      expect(page).to have_content(student.first_name)
      expect(page).to have_content(student.last_name)
      expect(page).to have_content(student.phone_number)
      expect(page).to have_content("English")
      expect(page).to have_link("Message")
    end
  end
end
