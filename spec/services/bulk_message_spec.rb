require 'rails_helper'

RSpec.describe BulkMessage do
  VCR.use_cassette("bulk_message_group_students") do
    it "can send a message to a group of students" do
      user = FactoryGirl.create(:user, language_code: "en")
      group = FactoryGirl.create(:group, user: user)
      student_1 = FactoryGirl.create(:student, language_code: "en")
      student_2 = FactoryGirl.create(:student, language_code: "es")


      FactoryGirl.create(:enrollment, group: group, student: student_1)
      FactoryGirl.create(:enrollment, group: group, student: student_2)

      FactoryGirl.create(:contact, contactable: student_1, phone_number: ENV["PHONE"])
      FactoryGirl.create(:contact, contactable: student_2, phone_number: ENV["PHONE"])

      body = "This is a test text message"

      bulk_message = BulkMessage.new(group, body)
      return_value = bulk_message.message_students

      expect(return_value.first.class).to eq(Message)
      expect(return_value.last.class).to eq(Message)
    end
  end
end
