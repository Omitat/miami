class ApplicationController < ActionController::Base
  private
  def current_admin
    @current_admin = session[:admin_id] ? session[:admin_id] : nil
  end

  helper_method :current_admin

  def require_logged_in
    unless current_admin
      redirect_to root_path
    end
  end
end
