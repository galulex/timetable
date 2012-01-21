class Admin::UsersController < AdminController

  def index
   @users = User.all
  end

  def create
    @users = Dispatcher.where(:id => params[:user_ids], :approved => false)
    unless @users.blank?
      @users.each do |user|
        user.update_attribute(:approved, true)
        UserMailer.invite(user).deliver
      end
    end
    redirect_to admin_users_path
  end

end
