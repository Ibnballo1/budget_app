class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def show
    @group = Group.find_by(id: params[:id])
    @entities = @group.entities
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @group.save
          redirect_to user_groups_path
        else
          redirect_to new_group_path
        end
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
