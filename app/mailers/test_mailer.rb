class TestMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def my_test_email
    mail(to: 'jayhawker805@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
