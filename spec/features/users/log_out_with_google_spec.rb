require 'rails_helper'

RSpec.feature "user logs out" do
  scenario "hover over avatar and click logout" do
    # user = FactoryGirl.build(:user)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    stub_omniauth
    
    visit root_path
    within "#dropdown1" do
      click_link "Logout"
    end

    within "ul.right" do
      expect(page).to_not have_css("img.responsive-img")
      expect(page).to have_content("Sign in with Google")
    end

    expect(page).to have_css("footer.indigo.lighten-2")
    expect(page).to_not have_css(".fixed-action-btn")
  end
end
