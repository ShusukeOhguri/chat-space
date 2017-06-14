class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      if user.update(user_params)
        redirect_to controller: :messages, action: :index
      else
        redirect_to controller: :users, action: :edit
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
