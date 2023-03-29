class EntityGroupsController < ApplicationController
  def index
    @entities_groups = EntityGroup.all
  end

  def new
    @entity_group = EntityGroup.new
  end

  def add_entity_to_group
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:entity_id])
    @entity_group = EntityGroup.new(group: @group, entity: @entity)
  
    if @entity_group.save
      # association created successfully
    else
      # handle error
    end
  end

end
