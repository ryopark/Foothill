# facebookログインのための機能(omniauth-facebook使用)。すでに登録していればサインインして、
# なければ、登録に飛ばす(/users/sign_up)
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
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
