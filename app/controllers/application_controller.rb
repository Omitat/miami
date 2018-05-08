class ApplicationController < ActionController::Base
  private
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])

  end

  helper_method :current_admin

  def require_logged_in
    unless current_admin
      redirect_to root_path
    end
  end
end
