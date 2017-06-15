class TestMailer < ApplicationMailer
  default from: "#{ENV['username']}"

  def my_test_email
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['username'],
                      :to      => 'jayhawker805@gmail.com',
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end
