class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user

    if @entity.save
      # Create associations between the entity and groups
      # @entity.groups << Group.find(params[:entity][:group_id]) if params[:entity][:group_id].present?
      # @entities_group = Entity_Group.new()
      @group = Group.find(:id)
      @entity.groupss << @group
      redirect_to groups_path, notice: 'Entity was successfully created.'
    else
      redirect_to new_entity_path
    end
  end

  def update
    if @entity.update(entity_params)
      # Clear existing associations and create new ones
      @entity.groups.clear
      @entity.groups << Group.find(params[:entity][:group_id]) if params[:entity][:group_id].present?
      redirect_to @entity, notice: 'Entity was successfully updated.'
    else
      render :edit
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
