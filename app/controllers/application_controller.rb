class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :verify_current_user

  protected

  def session_user
    return @session_user if defined? @session_user
    if session.has_key? :user_id
      @session_user ||= User.find_by_uid(session[:user_id])
    end
  end

  def current_user
    return @current_user if defined? @current_user
    return session_user unless params[:redu_user_id]

    user_id = params[:redu_user_id]
    if session_user.try(:uid) == user_id.try(:to_i)
      @current_user ||= session_user
    end
  end

  def client(space_id)
    ReduClient.new(current_user.access_token, space_id)
  end

  def verify_current_user
    unless current_user
      redirect = request.fullpath
      Rails.logger.info "verify_current_user: storing #{redirect} on session"
      session['redirect_to'] = redirect
      redirect_to create_session_path(provider: :redu)
    end
  end
end
