require 'rails_helper'

RSpec.feature "user messages a group of students" do
  scenario "from the new group message form" do
    VCR.use_cassette("user_messages_group_of_students") do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      group = FactoryGirl.create(:group, user: user)
      students = FactoryGirl.create_list(:student, 2)
      students.each do |student|
        FactoryGirl.create(:enrollment, group: group, student: student)
        FactoryGirl.create(:contact, contactable: student, phone_number: ENV["PHONE"])
      end

      visit root_path

      find(".btn-floating.btn-small.waves-effect.waves-light.indigo.darken-3").click

      visit(new_group_message_path(group))
      # expect(current_path).to eq(new_group_message_path(group))

      within "h4.contact-header" do
        expect(page).to have_content("Message to group: #{group.name}")
      end

      within "p.flow-text" do
        students.each { |student| expect(page).to have_content(student.name) }
      end

      fill_in "Body", with: "This is a test text message"

      click_on "Send"

      expect(current_path).to eq(group_path(group))
      within ".card-content" do
        expect(page).to have_content(group.name)
        expect(page).to have_css("#chart-2")
      end
    end
  end
end
