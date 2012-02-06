class UsersController < ApplicationController

  def new
    @dispatcher = Dispatcher.new
  end

  def create
    @dispatcher = Dispatcher.new(params[:dispatcher])
    flash[:notice] = t('.registration_thanks_and_invite') if @dispatcher.save
  end

  def edit
    if current_user
      @dispatcher = Dispatcher.find(params[:id])
    else
      @dispatcher = Dispatcher.find_by_token(params[:id])
      unless @dispatcher.nil?
        @dispatcher.update_attribute(:token, nil)
        flash[:notice] = t('.registration_thanks_and_login')
      end
      redirect_to :root
    end
  end

  def update
    @dispatcher = current_user
    @dispatcher.update_attributes(params[:dispatcher])
  end

end
