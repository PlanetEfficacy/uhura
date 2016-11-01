require 'rails_helper'

RSpec.feature "user logs out" do
  scenario "hover over avatar and click logout" do
    user = FactoryGirl.build(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on ".add"

    fill_in "Name", with: "605"
    click_button "Create"

    expect(current_path).to eq(classes_path)

    within "div.card" do
      expect(page).to have_content("605")
      expect(page).to have_link("Add")
    end
  end
end
