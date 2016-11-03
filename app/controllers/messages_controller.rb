class MessagesController < ApplicationController
  def new
    @message = current_user.messages.new(contact: current_contact.primary_contact)
  end

  def create
    @message = current_user.messages.new(message_params)
    translate_message = TranslateMessage.new(@message)
    return_value = translate_message.send
    if TranslateMessage.success?(return_value)
      @message.save!
      redirect_to student_path(@message.contact.contactable)
    else
      # sad path
    end
  end

  private

    def current_contact
      Student.find(params[:contact_id])
    end

    def message_params
      whitelist = params.require(:message).permit(:body)
      whitelist["contact_id"] = params[:contact_id]
      whitelist["user_id"] = current_user.id
      return whitelist
    end
end
