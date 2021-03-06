class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    user = User.from_omniauth request.env["omniauth.auth"]
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
    session["devise.user_attributes"] = user.attributes
      flash.notice = "We couldn't sign you in because: " + user.errors.full_messages.to_sentence
      redirect_to new_user_session_url
    end
  end

  # def facebook
  #     # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   user = User.from_omniauth(request.env["omniauth.auth"])

  #   if user.persisted?
  #     sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
    
  # end

end
