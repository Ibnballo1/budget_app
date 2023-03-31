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


# class EntitiesController < ApplicationController
#   def index
#     @entities = Entity.all
#   end
#   def new
#     # @group = Group.find(params[:group_id])
#     @entity = Entity.new
#     respond_to do |format|
#       format.html { render :new, locals: { group: @group, entity: @entity } }
#     end
#   end

#   # def create
#   #   @entity = Entity.create(entity_params.merge(user_id: current_user.id,
#   #                                               group_id: params[:group_id]))

#   #   respond_to do |format|
#   #     format.html do
#   #       if @entity.save
#   #         flash[:success] = 'Entity created successfully'
#   #         redirect_to user_groups_path
#   #       else
#   #         redirect_to new_group_path
#   #       end
#   #     end
#   #   end
#   # end

#   def create
#     @entity = Entity.new(entity_params)
#     @entity.user = current_user

#     if @entity.save
#       @entity.groups << Group.find(params[:entity][:group_ids]) if params[:entity][:group_ids].present?
#       redirect_to @user_groups_path, notice: 'Entity was successfully created.'
#     else
#       redirect_to new_group_path
#     end
#   end

#   def update
#     if @entity.update(entity_params)
#       @entity.groups.clear
#       @entity.groups << Group.find(params[:entity][:group_ids]) if params[:entity][:group_ids].present?
#       redirect_to @entity, notice: 'Entity was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   private

#   def entity_params
#     params.require(:entity).permit(:name, :amount, :entity_id)
#   end
# end
