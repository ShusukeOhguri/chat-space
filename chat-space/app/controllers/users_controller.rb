class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      if user.update(user_params)
        redirect_to user_registration_path, success: "更新に成功しました"
      else
        redirect_to edit_user_path, warning: "更新に失敗しました"
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
