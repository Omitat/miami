class ModelMailer < ApplicationMailer
  def my_first_email
    mail to: "tatmorris@gmail.com",
    subject: "Hi"
  end
end
