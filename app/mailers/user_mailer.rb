class UserMailer < ApplicationMailer
	 default from: "danny@gadaproductions.com"
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to our Site')
  end
end
