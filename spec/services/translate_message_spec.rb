require 'rails_helper'

RSpec.describe TranslateMessage do
  it "sends a translated message" do
    # VCR.use_cassette("translate_message_service_translation_required") do
      user = FactoryGirl.create(:user, phone_number: ENV["TWILIO_PHONE"])
      student = FactoryGirl.create(:student)
      contact = FactoryGirl.create(:contact, phone_number: ENV["PHONE"], contactable: student)
      message = FactoryGirl.create(:message, user: user, contact: contact)

      translate_message = TranslateMessage.new(message)
      return_value = translate_message.send

      expect(return_value.class).to_not eq(Twilio::REST::RequestError)
      expect(return_value.class).to eq(Twilio::REST::Message)
    # end
  end

  it "does not use translate service if language barrier is false" do
    VCR.use_cassette("translate_message_service_translation_not_required") do
      user = FactoryGirl.create(:user, phone_number: ENV["TWILIO_PHONE"])
      student = FactoryGirl.create(:student, language_code: "en")
      contact = FactoryGirl.create(:contact, phone_number: ENV["PHONE"], contactable: student)
      message = FactoryGirl.create(:message, user: user, contact: contact)

      translate_message = TranslateMessage.new(message)
      return_value = translate_message.send

      expect(return_value.class).to_not eq(Twilio::REST::RequestError)
      expect(return_value.class).to eq(Twilio::REST::Message)
    end
  end
end
