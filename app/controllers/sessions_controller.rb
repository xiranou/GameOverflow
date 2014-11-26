class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:log_in][:email])

    if user && user.authenticate(params[:log_in][:password])
      session[:user_id] = user.id
      redirect_to(articles_path)
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
