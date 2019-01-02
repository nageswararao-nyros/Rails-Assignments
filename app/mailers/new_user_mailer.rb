class NewUserMailer < ApplicationMailer
  default from: 'nageswararao.nyros@gmail.com'

  def notify_user_signup(user)
    @user = user
    attachments.inline["articles.jpg"] = File.read("#{Rails.root}/app/assets/images/articles.jpg")
    mail(to: @user.email, subject:"welcome")
  end

  def notify_user_post(article)
    @article = article
    mail(to: @article.email, subject:"welcome")
  end

  def notify_all(users)
    @users = users
    mail(to: users.pluck(:email), subject: "New article Notifications")
  end
end
