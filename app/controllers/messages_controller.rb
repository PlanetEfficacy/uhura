class MessagesController < ApplicationController
  def new
    @message = current_user.messages.new()
    binding.pry
  end

  private

    def current_student
      Student.find(params[:student_id])
    end
end
