require 'rails_helper'

RSpec.feature "user edits a group" do
  scenario "by completing the edit group form" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    find("#edit").click

    fill_in "Name", with: "605"
    click_on "Update"

    expect(current_path).to eq(groups_path)

    within "div.card" do
      expect(page).to have_content("605")
    end
  end
end
