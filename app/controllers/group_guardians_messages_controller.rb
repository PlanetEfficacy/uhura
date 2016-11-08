class GroupGuardiansMessagesController < ApplicationController
  def new
    @group = current_group
    @message = current_user.messages.new
  end

  def create
    @group = current_group
    bulk_message = BulkMessage.new(@group, message_params[:body])
    bulk_message.message_guardians
    redirect_to group_path(@group)
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end

    def current_group
      Group.find(params[:id])
    end
end
