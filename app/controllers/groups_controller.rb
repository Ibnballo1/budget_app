class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @entities_groups = EntitiesGroups.where(group_id: @groups.pluck(:id)).includes([:entity])
  end

  def show
    @group = Group.find_by(id: params[:id])
    @entity_group = EntityGroup.where(group_id: @group.id).includes([:entity])
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
