class User < ActiveRecord::Base

  attr_accessible :institution_id, :email, :first_name, :last_name, :password, :password_confirmation, :token

  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true,
                    :length => { :minimum => 3, :maximum => 254, :allow_blank => true },
                    :uniqueness => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true }

  def name
    "#{first_name} #{last_name}"
  end

end
