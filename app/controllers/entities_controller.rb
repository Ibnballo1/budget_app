class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @group_id = params[:group_id]
    @entities = Entity.all
  end

  def new
    @group_id = params[:group_id]
    @entity = Entity.new
  end

  def show
    @group = Group.find(params[:group_id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:id])
  end

  def create
    @user = current_user
    @entity = Entity.new(entity_params)
    @entity.user_id = @user.id

    if @entity.save
      @group_id = params[:group_id]
      @entity_group = EntityGroup.new(entity_id: @entity.id, group_id: @group_id)

      if @entity_group.save
        redirect_to group_url(@group_id), notice: 'Entity was successfully created.'
      else
        flash[:alert] = 'Entity Group couldn`t be saved'
        redirect_to new_group_entity_url(@group_id)
      end
    else
      flash[:alert] = 'Transaction couldn`t be saved, please check name and amount'
      @group_id = params[:group_id]
      redirect_to new_group_entity_url(@group_id)
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to group_url(@group), notice: 'Transaction was successfully destroyed.' }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
