class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.valid?
      ApplicationMailer.contact(@message).deliver_later
      redirect_to new_home_path
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      flash[:notice] = "There was an error sending your message. Please try again."
      # render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :email, :message, :contact)
  end
end
