class GroupsController < ApplicationController
  def index
    @goups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    # @group = Group.new(group_params)
    # if @group.save
    #   redirect_to new_group_path
    # else
    #   render 'new'
    # end

    @group = Group.create(group_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path
        else
          redirect_to new_group_path
        end
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
