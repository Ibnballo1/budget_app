class EntityGroupsController < ApplicationController
  before_action :set_entity_group, only: %i[show edit update destroy]

  # GET /entity_groups or /entity_groups.json
  def index
    @entity_groups = EntityGroup.all
  end

  # GET /entity_groups/1
  def show; end

  # GET /entity_groups/new
  def new
    @entity_group = EntityGroup.new
  end

  # GET /entity_groups/1/edit
  def edit; end

  # POST /entity_groups
  def create
    @entity_group = EntityGroup.new(entity_group_params)

    respond_to do |format|
      if @entity_group.save
        format.html { redirect_to group_entity_url(@entity_group), notice: 'Group entity was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity_groups/1
  def update
    respond_to do |format|
      if @entity_group.update(entity_group_params)
        format.html { redirect_to group_entity_url(@entity_group), notice: 'Group entity was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_groups/1
  def destroy
    @entity_group.destroy

    respond_to do |format|
      format.html { redirect_to group_entities_url, notice: 'Group entity was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity_group
    @entity_group = EntityGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_group_params
    params.fetch(:entity_group, {})
  end
end
