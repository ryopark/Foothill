## Deviseは本来、パスワードを要求しないとログインはできないので、継承してrewriteしてる。
class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_account_update_params, only: [:update]

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  private

  def account_update_params
    params.require(:user).permit(:name, :school_name, :email, :facebook_url, :major)
  end
end
