require 'rails_helper'

RSpec.describe TwilioService do
  it "sends sms messages" do
    VCR.use_cassette("twilio_service") do
      user_phone_number = ENV["TWILIO_PHONE"]
      contact_phone_number = ENV["PHONE"]
      message = "Hello world!"

      twilio_return = TwilioService.send({to: contact_phone_number,
                                          from: user_phone_number,
                                          body: message})

      expect(twilio_return.class).to_not eq(Twilio::REST::RequestError)
      expect(twilio_return.class).to eq(Twilio::REST::Message)
    end
  end
end
