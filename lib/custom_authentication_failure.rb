class CustomAuthenticationFailure < Devise::FailureApp
  protected
  def redirect_url
   root_path+'users/sign_up'
  end
end
