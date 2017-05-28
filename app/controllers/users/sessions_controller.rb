class Users::SessionsController < Devise::SessionsController


  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    if signed_out
      access_token = request.headers[:HTTP_ACCESS_TOKEN]
      binding.pry
        api_key = ApiKey.find_by_access_token(access_token)
        if api_key
          user = User.find(api_key.user_id)
          user.inactivate
        end
      set_flash_message :notice, :signed_out
    end
    yield if block_given?
    respond_to_on_destroy
  end


end
