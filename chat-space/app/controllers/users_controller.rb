class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to root_path
    else
      flash[:alert] =  "更新に失敗しました"
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
