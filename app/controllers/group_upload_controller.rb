class GroupUploadController < ApplicationController
  def new
    @group = current_group
  end

  def create
    group_maker = GroupMaker.new(current_group, file)
    if group_maker.success?
      redirect_to group_path(current_group)
    else
      # sad path
    end
  end

  private

    def current_group
      Group.find(params[:id])
    end
end
