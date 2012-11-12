class Schedule < ActiveRecord::Base

  #shit code. Needs to changed
  DAYS = { 1 => 'Mon', 2 => 'Tue', 3 => 'Wed', 4 => 'Thu', 5 => 'Fri', 6 => 'Sat' }

  validates :title, :presence => true

  has_many :teachers, :dependent => :delete_all
  has_many :audiences, :dependent => :delete_all
  has_many :groups, :dependent => :delete_all
  has_many :faculties, :dependent => :delete_all
  has_many :lessons, :dependent => :delete_all
  has_many :replacements, :dependent => :delete_all
  has_many :schedule_calls, :dependent => :delete_all
  belongs_to :dispatcher
  belongs_to :institution


  def days
    DAYS
  end

end
