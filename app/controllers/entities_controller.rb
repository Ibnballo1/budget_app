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
end
