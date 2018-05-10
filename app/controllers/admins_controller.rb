class AdminsController < ApplicationController
  before_action :authenticate_admin, except: [:new, :create, :show, :set_about]
  layout "cms"


  def new
    @admin = Admin.new
    # render :layout => false
  end

  def create
    # render :layout => false
    @admin = Admin.new admin_params

    if @admin.save
      redirect_to new_session_path, notice: "Created Admin"
    else
      render :new
    end
  end


  private
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

# make this method accessible in any controller
def current_user
  # memoization (caching) technique
  # multiple calls to this method will result in only one database query
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

  protected
  def authenticate_admin
    redirect_to root_path unless current_admin
  end


end
