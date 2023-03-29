class EntityGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:entity_id])
    @group.entities << @entity
    redirect_to user_groups_path, notice: "Entity was successfully added to the group."
  end

  private

  def entities_group_params
    params.require(:entities_group).permit(:group_id, :entity_id)
  end
end
