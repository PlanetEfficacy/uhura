class GroupUploadController < ApplicationController
  def new
    @group = current_group
  end

  def create
    group_maker = GroupMaker.new(current_group, file)
    group_maker.create_students_and_guardians
    redirect_to group_path(current_group)
  end

  private

    def current_group
      Group.find(params[:id])
    end

    def file
      params[:file]
    end
end
