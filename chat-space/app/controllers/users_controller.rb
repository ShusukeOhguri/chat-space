class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      if @user.update(user_params)
        flash[:notice] = "更新に成功しました"
        redirect_to root_path
      else
        flash[:alert] =  "更新に失敗しました"
        render "edit"
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
