class Schedule < ActiveRecord::Base

  DAYS = { 1 => 'Mon', 2 => 'Tue', 3 => 'Wed', 4 => 'Thu', 5 => 'Fri', 6 => 'Sat' }

  validates :title, :presence => true

  has_many :teachers, :dependent => :delete_all
  has_many :audiences, :dependent => :delete_all
  has_many :groups, :dependent => :delete_all
  has_many :lessons, :dependent => :delete_all
  has_many :schedule_calls, :dependent => :delete_all
  belongs_to :dispatcher

end
