require 'rails_helper'

RSpec.feature "user messages a student" do
  scenario "by completing the new message form" do
    VCR.use_cassette("messages_a_student_spec") do
      user = FactoryGirl.create(:user, phone_number: ENV["TWILIO_PHONE"])
      group = FactoryGirl.create(:group, user: user)
      student = FactoryGirl.create(:student)
      contact = FactoryGirl.create(:contact, contactable: student, phone_number: ENV["PHONE"])
      enrollment = FactoryGirl.create(:enrollment, group: group, student: student)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit group_path(group)
      find(".btn-floating.btn-large.waves-effect.waves-light.indigo.darken-3").click

      expect(current_path).to eq(new_message_path)

      within "h4.contact-header" do
        expect(page).to have_content("Message to: #{student.name}")
      end

      fill_in "Body", with: "This is a test text message"

      click_on "Send"

      expect(current_path).to eq(student_path(student))
      within ".area-of-interest" do
        expect(page).to have_content(student.name)
        expect(page).to have_content("Messages sent: 1")
      end
    end
  end
end
