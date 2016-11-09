require 'rails_helper'

RSpec.feature "visitor cannot see private content:" do
  scenario "when they go to /groups, they are redirected to home page" do
    visit groups_path
    expect(current_path).to eq(root_path)
  end

  scenario "when they go to /groups/:id, they are redirected to home page" do
    group = FactoryGirl.create(:group)
    visit group_path(group)
    expect(current_path).to eq(root_path)
  end

  scenario "when they go to /groups/new, they are redirected to home page" do
    visit new_group_path
    expect(current_path).to eq(root_path)
  end
end
