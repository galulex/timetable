class SessionsController < ApplicationController

  def show
    client = fb_client
    access_token = client.authorize(:code => params[:code])
    @user = Student.authenticate(client.me.info, access_token.token)
    if @user
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to :root, :error => t('.try_more')
    end
  end

  def create
    @user = Dispatcher.authenticate(params[:email], params[:password])
    if @user.nil?
      @message = t('.invalid_credentials')
    else
      if @user.approved?
        session[:user_id] = @user.id
      else
        @message = t('.not_approved_account')
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
