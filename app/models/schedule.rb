class Schedule < ActiveRecord::Base

  DAYS = { 1 => 'Mon', 2 => 'Tue', 3 => 'Wed', 4 => 'Thu', 5 => 'Fri', 6 => 'Sat' }

  validates :title, :presence => true

  has_many :teachers
  has_many :audiences
  has_many :groups
  has_many :lessons
  has_many :schedule_calls
  belongs_to :dispatcher

end
