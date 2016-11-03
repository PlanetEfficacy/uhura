class MessagesController < ApplicationController
  def new
    @message = current_user.messages.new(contact: current_contact.primary_contact)
  end

  def create
    @message = current_user.messages.new(message_params)
    binding.pry
    redirect_to student_path(current_student)
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
