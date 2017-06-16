module Admin::CoordinatorHelper
  require 'sendgrid-ruby'
  include SendGrid

  def test_email
    from = Email.new(email: "#{ENV['SENDGRID_USERNAME']}")
    subject = 'Hello World from the SendGrid Ruby Library!'
    to = Email.new(email: 'amonroe805@ku.edu')
    content = Content.new(type: 'text/plain', value: 'Hello, Email!')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
