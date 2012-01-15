class SessionsController < ApplicationController

  def show
    client = fb_client
    access_token = client.authorize(:code => params[:code])
    @user = Student.authenticate(client.me.info, access_token.token)
    if @user
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to :root, :error => 'Some thing has went wrong. Try one more time'
    end
  end

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

end
