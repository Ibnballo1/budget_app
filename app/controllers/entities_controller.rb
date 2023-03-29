class EntitiesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group, entity: @entity } }
    end
  end

  def create
    @entity = Entity.create(entity_params.merge(user_id: current_user.id,
                                                group_id: params[:group_id]))

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
    params.require(:entity).permit(:name, :amount, :entity_id)
  end
end
