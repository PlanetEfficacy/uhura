require 'rails_helper'

RSpec.feature "user creates many students" do
  xscenario "by importing a Google Spreadsheet" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)
    find("#bulk-upload").click

    # click_on "Create"
    # # find(".waves-button-input").click
    #
    # expect(current_path).to eq(groups_path)
    #
    # within "div.card" do
    #   expect(page).to have_content("605")
    #   expect(page).to have_link("Add Students")
    #   expect(page).to have_link("Upload Students")
    # end
  end
end
