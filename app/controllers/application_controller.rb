class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :store_location

  def store_location
    session[:previous_url] = request.fullpath if check_request_fullpath
  end

  def after_sign_in_path_for(resource)
    if (session[:previous_url] == root_path)
      super
    else
      session.delete(:previous_url) || root_path
    end
  end

  private

  def check_request_fullpath
    request.fullpath != '/users/sign_up' && !request.fullpath.include?('/users/auth/facebook/') && !request.xhr?
  end
end
