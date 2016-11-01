require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"

    within ".navbar-fixed" do
      expect(page).to have_css("img.responsive-img")
      expect(page).to have_css("nav.indigo")
    end

    expect(page).to have_css("footer.indigo.lighten-2")
    expect(page).to have_css(".fixed-action-btn")
  end
end
