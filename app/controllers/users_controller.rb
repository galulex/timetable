class UsersController < ApplicationController

  def new
    @user = Dispatcher.new
  end

  def create
    @user = Dispatcher.new(params[:dispatcher])
    flash[:notice] = t('.flash.registration_thanks_and_invite') if @user.save
    UserMailer.invite(@user).deliver
  end

  def edit
    if current_user
      @user = current_user
    else
      @user = User.find_by_token(params[:id])
      unless @user.nil?
        @user.update_attribute(:token, nil)
        flash[:notice] = t('.flash.registration_thanks_and_login')
      end
      redirect_to :root
    end
  end

  def update
    @user = current_user
    @user.update_attributes(params[:dispatcher] || params[:student])
  end

end
