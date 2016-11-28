require 'rails_helper'

RSpec.feature "user messages a group of students' guardians" do
  scenario "from the new group message form" do
    VCR.use_cassette("user_messages_group_of_guardians") do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      group = FactoryGirl.create(:group, user: user)
      students = FactoryGirl.create_list(:student, 2)

      students.each do |student|
        FactoryGirl.create(:enrollment, group: group, student: student)
      end

      guardian_1 = FactoryGirl.create(:guardian, language_code: "vi", primary: true)
      guardian_2 = FactoryGirl.create(:guardian, language_code: "iw", primary: true)
      contact_1 = FactoryGirl.create(:contact, contactable: guardian_1, phone_number: ENV["PHONE"])
      contact_2 = FactoryGirl.create(:contact, contactable: guardian_2, phone_number: ENV["PHONE"])

      FactoryGirl.create(:guardianship, student: students.first, guardian: guardian_1)
      FactoryGirl.create(:guardianship, student: students.second, guardian: guardian_2)

      visit root_path

      find(".btn-floating.btn-small.waves-effect.waves-light.indigo.darken-3").click

      visit(new_group_guardian_message_path(group))

      within "h4.contact-header" do
        expect(page).to have_content("Message to group: #{group.name}")
      end

      within "h5" do
        expect(page).to have_content("Messaging guardians:")
      end

      within "div.row > p" do
        expect(page).to have_content(group.primary_guardian_names.join(", "))
      end

      within "p.flow-text" do
        expect(page).to have_content(guardian_1.name)
        expect(page).to have_content(guardian_2.name)
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
