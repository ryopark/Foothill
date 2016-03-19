class OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'].except('extra'))

    if @user.persisted?
      flash.notice = 'successfully login'
      sign_in_and_redirect @user
    else
      session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
