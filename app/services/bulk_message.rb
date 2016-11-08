class BulkMessage
  attr_reader :group,
              :user_language,
              :contact_language,
              :contact,
              :message_body,
              :message

  def initialize(group, body)
    @group = group
    @message_body = body
    @user_langague = group.user.language_code
  end

  def message_students
    group.students.map do |student|
      @contact_language = student.language_code
      @contact = student.phone_number
      @message = set_message
      result = send
      if result.class == Twilio::REST::Message
        Message.create(user: group.user,
                       contact_id: student.id,
                       body: message_body)
      end
    end
  end

  private

    def send
      TwilioService.send({to: contact,
                          from: ENV["TWILIO_PHONE"],
                          body: message})
    end

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
