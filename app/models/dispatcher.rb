require 'digest'
class Dispatcher < User

  has_secure_password

  validates :password, :presence => true, :confirmation => true, :on => :create

  before_create :generate_token

  has_many :schedules, :dependent => :delete_all
  has_one :institution, :dependent => :destroy

  accepts_nested_attributes_for :institution
  attr_accessible :institution_attributes

  def generate_token
    self.token = Digest::SHA1.hexdigest(Time.now.to_s)
  end

end
