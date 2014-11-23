class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to article_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :email, :password, :password_confirmation, :about, )
  end
end