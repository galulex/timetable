class ScheduleCall < ActiveRecord::Base

  validates :number, :begin, :end, :presence => true
  validates :number, :numericality => true

  has_many :lessons
  belongs_to :schedule

end
