class GroupsController < ApplicationController
  def index
    @groups = current_user.groups if current_user
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save!
      redirect_to groups_path
    else
      # render :new
    end
  end

  def show
    @students = current_group.students
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def current_group
    Group.find(params[:id])
  end
end
