class GroupsController < ApplicationController
  before_action :get_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path, notice: "グループの情報の作成に成功しました"
    else
      render "new"
    end
  end

  def edit
  end

  def show
    @groups = current_user.groups
    @group_name = Group.find(params[:id])
    @group_members = Group.find(params[:id]).users
    render "index"
  end

  def update
    if @group.update(create_params)
      redirect_to root_path, notice: "グループの情報の更新に成功しました"
    else
      render "edit"
    end
  end

  private
    def get_group
      @group = Group.find(params[:id])
    end

    def create_params
      params.require(:group).permit(:name, user_ids: [])
    end
end
