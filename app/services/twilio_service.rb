class TwilioService
  def self.send(message_params)
    begin
      @client = Twilio::REST::Client.new ENV["TWILIO_ID"], ENV["TWILIO_SECRET"]
      message = @client.account.messages.create(message_params)
    rescue Twilio::REST::RequestError => e
      e
    end
  end
end
