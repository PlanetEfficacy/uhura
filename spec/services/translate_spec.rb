require 'rails_helper'

RSpec.describe Translate do
  it "translates a message from one language to another" do
    VCR.use_cassette("translate_service") do
      message = "Hello world!"
      from = "en"
      to = "la"
      translation = Translate.translate(message: message, from: from, to: to)
      expect(translation).to eq("Salve mundi!")
    end
  end
end
