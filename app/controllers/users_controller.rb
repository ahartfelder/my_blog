class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def new
    @user = User.new
  end
  def edit
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to My Blog '#{@user.username}'! You have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end      
  end
  def update
    if User.update(user_params)
      flash[:notice] = "Your account has been successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end