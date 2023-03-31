class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
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

  # def create
  #   @group = Group.new(group_params)
  #   @group.user_id = current_user.id

  #   respond_to do |format|
  #     if @group.save
  #       # Create associations between the group and entities
  #       # @group.entities << Entity.find(params[:group][:entity_id]) if params[:group][:entity_id].present?
  #       # group = Group.find(1)
  #       @entity = Entity.find(:id)
  #       @group.entities << @entity

  #       format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :group_id)
  end
end
