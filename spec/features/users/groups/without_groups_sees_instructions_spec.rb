require 'rails_helper'

RSpec.feature "user who visits group page and has no groups" do
  scenario "sees instructions for making groups" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit groups_path

    within "div.modal.start-open" do
      expect(page).to have_content(Dialogue.how_to_make_groups)
      expect(page).to have_link("Create your first group")
    end
  end
end
