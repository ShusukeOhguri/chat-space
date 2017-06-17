class GroupsController < ApplicationController
  def index
  end

    def edit
      @group = Group.find(params[:id])
    end
  
    def update
      @group = Group.find(params[:id])
      if @group.update(update_params)
        redirect_to root_path, notice: "グループの情報の更新に成功しました"
      else
        flash[:alert] =  "グループ情報の更新に失敗しました"
        render "edit"
      end
    end

  private
  def update_params
    params.require(:group).permit(:name)
  end
end
