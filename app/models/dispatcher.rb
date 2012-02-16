require 'digest'
class Dispatcher < User

  has_secure_password

  validates :password, :presence => true, :confirmation => true, :on => :create

  before_create :generate_token

  has_many :schedules, :dependent => :delete_all
  has_one :institution, :dependent => :destroy

  accepts_nested_attributes_for :institution
  attr_accessible :institution_attributes

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt) && user.token.nil?
      user
    else
      nil
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest(Time.now.to_s)
  end

end
