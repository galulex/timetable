class User < ActiveRecord::Base

  attr_accessible :institution_id, :email, :first_name, :last_name, :password, :password_confirmation, :token

  def name
    "#{first_name} #{last_name}"
  end

end
