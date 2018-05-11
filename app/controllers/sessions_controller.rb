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
end

    def destroy
      if session[:admin_id]
        session.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'You have been logged out.' }
          format.json { head :no_content }
      end
    end
  end
end
