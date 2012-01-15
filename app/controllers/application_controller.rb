class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }

  helper_method :current_user, :fb_client

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def fb_client( token = nil )
    FacebookOAuth::Client.new(
      :application_id => CONFIG['facebook']['key'],
      :application_secret => CONFIG['facebook']['secret'],
      :callback => session_url,
      :token => token
    )
  end

end
