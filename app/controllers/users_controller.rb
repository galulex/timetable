class UsersController < ApplicationController

  def new
    @dispatcher = Dispatcher.new
  end

  def create
    @dispatcher = Dispatcher.new(params[:dispatcher])
    flash[:notice] = 'Thanks for regisration. We will send you invitation after admin approval' if @dispatcher.save
  end

  def edit
    if current_user
      @dispatcher = Dispatcher.find(params[:id])
    else
      @dispatcher = Dispatcher.find_by_token(params[:id])
      unless @dispatcher.nil?
        @dispatcher.update_attribute(:token, nil)
        flash[:notice] = 'Thank you for registration. Please login with your credentials to continue'
      end
      redirect_to :root
    end
  end

  def update
    @dispatcher = current_user
    @dispatcher.update_attributes(params[:dispatcher])
  end

end
