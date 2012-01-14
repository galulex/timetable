class UsersController < ApplicationController

  def edit
    @dispatcher = Dispatcher.find_by_token(params[:id])
    redirect_to :root if @dispatcher.nil?
  end

  def update
    @dispatcher = Dispatcher.find_by_token(params[:id])
    if @dispatcher.update_attributes(params[:dispatcher])
      redirect_to :root, :notice => 'Thank you for registration. Please login with your credentials to continue'
    else
      render :action => :edit
    end
  end

end
