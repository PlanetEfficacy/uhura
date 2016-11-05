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
    @group = current_group
    @students = current_group.students
  end

  def destroy
    current_group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def current_group
    Group.find(params[:id])
  end
end
