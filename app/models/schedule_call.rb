class ScheduleCall < ActiveRecord::Base

  validates :start_at, :presence => true

  has_many :lessons
  belongs_to :schedule

  def finish_at
    start_at + schedule.lesson_duration
  end

end
