class CoordinatorInviteMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  def send_invite(@coordinator)
    from = Email.new(email: "#{ENV['SENDGRID_USERNAME']}")
    subject = 'Join the CCO team!'
    to = Email.new(email: @coordinator.email)
    content = Content.new(type: 'text/plain', value: 'Hello, Email!')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
