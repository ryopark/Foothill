module ControllerMacros
  def login_user(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ControllerMacros, type: :controller
  config.include Devise::TestHelpers, type: :controller
end
