require 'rails_helper'

RSpec.feature "user messages a guardian" do
  scenario "by completing the new message form" do
    VCR.use_cassette("messages_a_guardian_spec") do
      user = FactoryGirl.create(:user, phone_number: ENV["TWILIO_PHONE"])
      student = FactoryGirl.create(:student)
      guardian = FactoryGirl.create(:guardian)
      guardianship = FactoryGirl.create(:guardianship, student: student, guardian: guardian)
      contact = FactoryGirl.create(:contact, contactable: guardian, phone_number: ENV["PHONE"])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit student_path(student)
      find(".btn-floating.btn-large.waves-effect.waves-light.indigo.darken-3").click

      expect(current_path).to eq(new_message_path)

      within "h4.contact-header" do
        expect(page).to have_content("Message to: #{guardian.name}")
      end

      fill_in "Body", with: "This is a test text message"

      click_on "Send"

      expect(current_path).to eq(guardian_path(guardian))

      within ".area-of-interest" do
        expect(page).to have_content(guardian.name)
        expect(page).to have_content("Messages sent: 1")
      end
    end
  end
end
