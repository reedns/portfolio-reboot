class SessionsController < ApplicationController
  def new;end

  def create
    admin = Admin.find_by_username(params[:username])
    #require 'pry'; binding.pry
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to root_path, notice: 'Success! You are signed in.'
    else
      flash.now[:error] = 'Oops! Looks like your username or password were incorrect.'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: 'Success! You are signed out.'
  end
end
