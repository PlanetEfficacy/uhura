require 'rails_helper'

RSpec.feature "user visits Uhura" do
  scenario "and sees the homepage content" do
    visit root_path

    within ".navbar-fixed" do
      expect(page).to have_link("Sign in with Google")
    end

    expect(page).to have_css("div.parallax-container", count: 2)

    within "div.section.indigo.lighten-2" do
      expect(page).to have_content(Dialogue.landing_page_text)
      expect(page).to have_content("school")
      expect(page).to have_content(Dialogue.landing_page_left_content_block_header)
      expect(page).to have_content(Dialogue.landing_page_left_content_block_text)
      expect(page).to have_content("textsms")
      expect(page).to have_content(Dialogue.landing_page_center_content_block_header)
      expect(page).to have_content(Dialogue.landing_page_center_content_block_text)
      expect(page).to have_content("translate")
      expect(page).to have_content(Dialogue.landing_page_right_content_block_header)
      expect(page).to have_content(Dialogue.landing_page_right_content_block_text)
    end
    
    expect(page).to have_css("footer.indigo.lighten-2")

    expect(page).to_not have_css(".fixed-action-btn")
  end
end
