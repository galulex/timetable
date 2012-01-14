class Admin::UsersController < AdminController

  def index
   @users = User.all
  end

  def new
    @dispatcher = Dispatcher.new
  end

  def create
    @dispatcher = Dispatcher.create(params[:dispatcher])
    p @dispatcher.errors
  end

end
