class GroupsController < ApplicationController
  before_action :edit, only: :update

  def index
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
    @group = Group.find(params[:id])  
  end 
  
  def update  
    if @group.update(create_params) 
      redirect_to root_path, notice: "グループの情報の更新に成功しました"  
    else  
      render "edit" 
    end 
  end 
  
  private 
    def create_params 
      params.require(:group).permit(:name, user_ids: [])  
    end 
end
