class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :client

  protected

  def current_user
    if uid = session[:user_id]
      User.find_by_uid(uid)
    end
  end

  def client(space_id)
    ReduClient.new(current_user.access_token, space_id)
  end
end
