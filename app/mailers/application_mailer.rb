class ApplicationMailer < ActionMailer::Base
  require 'mailgun'
  default from: 'me@sandboxb8a17ebd0d7b455a860d48057ae62466.mailgun.org'
  layout 'mailer'



  def contact(message)
    @body = message.body
    mg_client = Mailgun::Client.new ENV['22542ea6e7dcc702d3ae3c8f5f62224a-97923b2d-c7e98082']
    message_params = {
      :from => message.email,
      :to => ENV['email'],
      :subject => 'Contact Form',
      :text => message.body
      }
      mg_client.send_message ENV['sandboxb8a17ebd0d7b455a860d48057ae62466.mailgun.org'], message_params
    end


  end
