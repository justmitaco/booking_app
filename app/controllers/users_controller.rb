class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = current_user
      if @user.update(current_user_params)
          flash[:notice] = "保存しました。"
      else
          flash[:alert] = "更新できません。"
      end
      redirect_to :users
  end

  def destroy
  end
  
  private
  def current_user_params
    params.require(:user).permit(:about, :status, :avatar)
  end
  
end
