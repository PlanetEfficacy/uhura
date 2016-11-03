class TranslateMessage
  attr_reader :message_body,
              :user_language,
              :contact_language,
              :message,
              :contact,
              :user

  def initialize(message)
    @message_body = message.body
    @user_language = message.user.language_code
    @contact_language = message.contact.contactable.language_code
    @message = set_message
    @contact = message.contact.phone_number
    @user = message.user.phone_number
  end

  def send
    TwilioService.send({to: contact,
                        from: user,
                        body: message})
  end

  def self.success?(return_value)
    return_value.class == Twilio::REST::Message
  end

  private

    def translate
      Translate.translate(message: message_body,
                          from: user_language,
                          to: contact_language)
    end

    def set_message
      if language_barrier?
        translate
      else
        message_body
      end
    end

    def language_barrier?
      user_language != contact_language
    end
end
