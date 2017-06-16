class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "更新に成功しました"
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
