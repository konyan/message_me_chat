class SessionsController < ApplicationController

  def new

  end

  def create
    @user =User.find(user: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login Successfully"
      redirect_to root_path
    else
      flash.now[:danger] = "username or password wrong"
      render :new
    end
  end

end
