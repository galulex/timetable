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
    @user = Dispatcher.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.approved?
        session[:user_id] = @user.id
      else
        @message = t('.not_approved_account')
      end
    else
      @message = t('.invalid_credentials')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
