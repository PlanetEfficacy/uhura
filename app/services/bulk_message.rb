class BulkMessage
  attr_reader :group,
              :body,
              :user,
              :translate_message

  def initialize(group, body)
    @group = group
    @body = body
    @user = group.user
  end

  def message_students
    group.students.active.map { |student| message(student) }
  end

  def message_guardians
    group.students.active.map { |student| message(student.primary_guardian) }
  end

  private

    def message(contactable)
      message = create_message(contactable)
      save_and_return(message)
    end

    def create_message(contactable)
      Message.new(user_id: user.id,
                  contact_id: contact(contactable),
                  body: body)
    end

    def contact(contactable)
      contactable.contacts.find_by(default: true).id
    end

    def save_and_return(message)
      if TranslateMessage.success?(TranslateMessage.new(message).send)
        message.save!
        message
      end
    end
end
