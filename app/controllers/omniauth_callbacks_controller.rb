class OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash.notice = 'successfully login'
      sign_in_and_redirect @user
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
