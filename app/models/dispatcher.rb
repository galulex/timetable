require 'digest'
class Dispatcher < User

  attr_accessor :password

  validates :password, :presence => true, :confirmation => true, :on => :create
  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true,
                    :length => { :minimum => 3, :maximum => 254, :allow_blank => true },
                    :uniqueness => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true }

  before_save :encrypt_password
  before_create :generate_token

  has_many :schedules, :dependent => :delete_all

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest(Time.now.to_s)
  end

end
