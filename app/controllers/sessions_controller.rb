class SessionsController < ApplicationController

  def create
    @user = Dispatcher.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id if @user
    @message = 'Invalid email or password' unless @user
    respond_to do |format|
      format.js
      format.html do
        if @user
          redirect_to schedules_url
        else
          flash.now[:error] = 'Invalid email or password'
          render :action => :new
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def auth
    @client = FacebookOAuth::Client.new(
      :application_id => CONFIG['facebook']['key'],
      :application_secret => CONFIG['facebook']['secret'],
      :callback => 'http://localhost:3000',
      :token => session[:access_token]
    )
    redirect_to @client.authorize_url
  end

end
