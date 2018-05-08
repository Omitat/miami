class AdminController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new user_params

    if @admin.save
      redirect_to root_path, notice: "Created Admin"
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:admin).permit(:email, :password_digest, :password_confirmation)
  end
end
