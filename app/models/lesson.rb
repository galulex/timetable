class Lesson < ActiveRecord::Base

  validates :name, :teacher_id, :audience_id, :schedule_id, :group_id, :presence => true

  belongs_to :teacher
  belongs_to :audience
  belongs_to :schedule
  belongs_to :group

end
