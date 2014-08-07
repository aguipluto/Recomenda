class OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      flash[:success] = "Bienvenido" if is_navigational_format?
      redirect_to static_pages_private_url
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
