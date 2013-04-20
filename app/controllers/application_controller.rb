class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  protected

  def current_user
    if uid = session[:user_id]
      User.find_by_uid(uid)
    end
  end
end
