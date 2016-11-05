require 'rails_helper'

RSpec.feature "user deletes a group" do
  scenario "by clicking the delete button" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    find(".delete").click
    click_link "Delete this group"

    expect(current_path).to eq(groups_path)
    expect(page).to_not have_css("div.card")
  end
end
