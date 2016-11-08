require 'rails_helper'

RSpec.describe BulkMessage do
  it "can send a message to a group of students" do
    VCR.use_cassette("bulk_message_group_students") do
      user = FactoryGirl.create(:user, language_code: "en")
      group = FactoryGirl.create(:group, user: user)
      student_1 = FactoryGirl.create(:student, language_code: "en")
      student_2 = FactoryGirl.create(:student, language_code: "es")


      FactoryGirl.create(:enrollment, group: group, student: student_1)
      FactoryGirl.create(:enrollment, group: group, student: student_2)

      contact_1 = FactoryGirl.create(:contact, contactable: student_1, phone_number: ENV["PHONE"])
      contact_2 = FactoryGirl.create(:contact, contactable: student_2, phone_number: ENV["PHONE"])

      body = "This is a test text message"

      bulk_message = BulkMessage.new(group, body)
      messages = bulk_message.message_students

      expect(messages.first.class).to eq(Message)
      expect(messages.first.user_id).to eq(user.id)
      expect(messages.first.contact_id).to eq(contact_1.id)
      expect(messages.first.body).to eq(body)
      expect(messages.last.class).to eq(Message)
      expect(messages.last.user_id).to eq(user.id)
      expect(messages.last.contact_id).to eq(contact_2.id)
      expect(messages.last.body).to eq(body)
    end
  end
end
