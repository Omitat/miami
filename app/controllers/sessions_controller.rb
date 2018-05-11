class SessionsController < ApplicationController
  def new
    end

    def create
      # @admin = Admin.find_by(email: params[:email]).try(:authenticate, params[:password_digest])
      if params[:code] && params[:state]
        session[:admin_id] = params[:code]
        redirect_to home_show_path
      else
        render :new
      end
      def destory

      end
    end
  end
