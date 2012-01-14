class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
