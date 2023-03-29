class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
    @groups = Group.all
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.create(entity_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @entity.save
          flash[:success] = 'Entity created successfully'
          redirect_to user_groups_path
        else
          redirect_to new_group_path
        end
      end
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
