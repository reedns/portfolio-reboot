class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin, :admin_signed_in?, :require_admin

  def admin
    @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def admin_signed_in?
    !!admin
  end

  def require_admin
    unless admin
      flash[:error] = 'You must be an admin to do that.'
      redirect_to root_path
    end
  end
end
