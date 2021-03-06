class Replacement < ActiveRecord::Base

  validates :name, :teacher_id, :audience_id, :schedule_id, :group_id, :day_id, :schedule_call_id, :lesson_id, :date, :presence => true

  belongs_to :teacher
  belongs_to :audience
  belongs_to :schedule
  belongs_to :group
  belongs_to :schedule_call
  belongs_to :lesson

  scope :for_day, lambda { |day| where(:day_id => day) unless day.blank? }

end
