class SessionsController < ApplicationController
  def new;end

  def create
    admin = Admin.find_by_username(params[:username])
    #require 'pry'; binding.pry
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to root_path, flash.now[:notice 'Success! You are signed in.'
    else
      flash.now[:error] = 'Oops! Please fix the errors below.'
      render :new
    end
  end
end
