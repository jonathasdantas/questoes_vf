class SessionsController < ApplicationController
  def create
    @user = current_user || User.create_with_omniauth(auth_hash)

    session[:user_id] = @user.uid
    redirect_to inicial_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end