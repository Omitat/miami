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

  protected
  def authenticate_admin
    redirect_to root_path unless current_admin
  end


  POST https://scott4044.auth0.com/passwordless/start
    {
     "client_id": "Ip8aDyIEjr8d1ssjjrP4r4shQLbgNAYt",
     "connection": "sms",
     "phone_number": "+12153609696",
     "send": "code"
    }
end
