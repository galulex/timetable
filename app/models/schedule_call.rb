class ScheduleCall < ActiveRecord::Base

  validates :start_at, :presence => true

  has_many :lessons
  has_many :replacements
  belongs_to :schedule


  def time
    [start_at.strftime('%R'), finish_at.strftime('%R')].join('-')
  end

end
