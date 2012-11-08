class ScheduleCall < ActiveRecord::Base

  validates :start_at, :presence => true
  validates :finish_at, :presence => true

  validate :finish_at_more_start_at, :finish_at_more_limit_minutes

  has_many :lessons
  has_many :replacements
  belongs_to :schedule


  def time
    [start_at.strftime('%R'), finish_at.strftime('%R')].join('-')
  end

  def finish_at_more_start_at
    if start_at && start_at > finish_at
      errors.add(:finish_at, "can't be finish at less start at")
    end
  end

  def finish_at_more_limit_minutes
    if !start_at or finish_at < start_at + 45.minutes
      errors.add(:finish_at, "can't be finish at less 45 minutes")
    end
  end
end
