class SessionsController < ApplicationController
  def new

    end

    def create
      @admin = Admin.find_by(email: params[:email]).try(:authenticate, params[:password_digest])

      if @admin
        session[:admin_id] = @admin.id
        redirect_to admin_path
      else
        render :new
      end
    end
  end
