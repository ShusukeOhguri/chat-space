class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
      if user.id == current_user.id
        if params.require(:user)[:name].present?
          if params.require(:user)[:email].present?
            user.update(user_params)
          end
        end
      end
    redirect_to controller: :messages, action: :index
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
