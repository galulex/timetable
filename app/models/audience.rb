class Audience < ActiveRecord::Base

  validates :title, :presence => true

  has_many :lessons
  belongs_to :schedule

end
