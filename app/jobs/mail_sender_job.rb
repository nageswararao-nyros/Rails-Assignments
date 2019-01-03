class MailSenderJob < ApplicationJob
  queue_as :default

  after_perform :some_response

  rescue_from Net::SMTPFatalError , with: :mail_error

  def perform(user)
    NewUserMailer.notify_user_signup(user).deliver_now
  end

  private

  def some_response
    puts"performed just now @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  end

  def mail_error
    puts "Mail error**********@@@@@@@@@@@"
  end
end
