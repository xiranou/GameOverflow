class SessionsController < ApplicationController

  # def new
  # end

  def create
    user = User.where(email: params[:sign_in][:email])

    if user && user.authenticate(params[:sign_in][:password])
      session[:user_id] = user.id
      redirect_to article_path
    else
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to(root_path)
    end
  end


end