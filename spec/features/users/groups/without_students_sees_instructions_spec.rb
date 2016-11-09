require 'rails_helper'

RSpec.feature "user who visits group show page and has no students" do
  scenario "sees instructions for making students" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    within "div.modal.start-open" do
      expect(page).to have_content(Dialogue.how_to_make_students)
      expect(page).to have_link("Create your first student")
    end
  end
end
