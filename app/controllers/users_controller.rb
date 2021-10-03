class UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    end
  end
  def user_params
    params.require(:user).permit(
      :name, 
      :email,
      :tel,
      :postal,
      :address)
  end

end
