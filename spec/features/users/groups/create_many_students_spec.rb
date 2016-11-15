require 'rails_helper'

RSpec.feature "user creates many students and guardians" do
  scenario "by uploading properly formatted csv" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)
    find("#upload").click
    attach_file('file', Rails.root + "spec/fixtures/student_data.csv")

    click_button "Upload"

    expect(current_path).to eq(group_path(group))
    expect(page).to have_css("li.collection-item", count: 4)

    click_link "Jaime Lannister"
    expect(page).to have_css("li.collection-item", count: 1)

    within "li.collection-item" do
      expect(page).to have_link("Tywin Lannister")
      expect(page).to have_content("English")
      expect(page).to have_content("555-555-5556")
    end
  end
end
