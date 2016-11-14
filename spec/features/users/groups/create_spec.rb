require 'rails_helper'

RSpec.feature "user creates a group" do
  scenario "by completing the new group form" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    find(".btn-floating.btn-large.waves-effect.waves-light.amber.accent-2").click

    fill_in "Name", with: "605"
    click_on "Create"

    expect(current_path).to eq(groups_path)

    within "div.card" do
      expect(page).to have_content("605")
      expect(page).to have_css("a.btn-floating.btn-small.waves-effect.waves-light.indigo.darken-3.group-text-btn")
    end
  end
end
