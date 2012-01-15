class Lesson < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :teacher
  belongs_to :audience
  belongs_to :schedule

end
