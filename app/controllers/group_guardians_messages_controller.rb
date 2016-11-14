class GroupGuardiansMessagesController < ApplicationController
  before_action :current_group

  def new
    @message = current_user.messages.new
  end

  def create
    bulk_message = BulkMessage.new(@group, message_params[:body])
    bulk_message.message_guardians
    redirect_to group_path(@group)
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end

    def current_group
      @group = Group.find(params[:id])
    end
end
