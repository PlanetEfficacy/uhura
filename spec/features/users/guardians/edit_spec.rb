require 'rails_helper'

RSpec.feature "user edits a guardian" do
  scenario "by completing the edit guardian form" do
    user = FactoryGirl.create(:user)
    student = FactoryGirl.create(:student)
    guardian = FactoryGirl.create(:guardian)
    contact = FactoryGirl.create(:contact, contactable: guardian)
    FactoryGirl.create(:guardianship, guardian: guardian, student: student)
    group = FactoryGirl.create(:group, user: user)
    FactoryGirl.create(:enrollment, group: group, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit guardian_path(guardian)

    find(".btn-floating.amber").click
    expect(current_path).to eq(edit_guardian_path(guardian))

    fill_in "First name", with: "Luke"
    fill_in "Last name", with: "Skywalker"
    fill_in "contact_phone_number", with: "123-456-7891"
    find("option[value='vi']").select_option
    find("#relationship-select").find("option[value='Clergy']").select_option
    find(:css, "#primary-contact").set(false)

    click_on "Update"

    expect(current_path).to eq(guardian_path(guardian))

    within "div.card" do
      expect(page).to have_content("Luke Skywalker")
      expect(page).to have_content("123-456-7891")
      expect(page).to have_content("Vietnamese")
      expect(page).to have_content("Clergy")
    end
  end
end
