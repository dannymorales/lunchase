class MyRegistrationsController < Devise::RegistrationsController
protected

  def create
    super
    if @user.persisted?
      UserMailer.welcome_email(@user).deliver
      
    end
  end

  def after_sign_up_path_for(resource)
    redirect_to lunch_specials_path
  end


end