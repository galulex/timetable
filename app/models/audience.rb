class Audience < ActiveRecord::Base

  validates :title, :presence => true

  has_many :lessons
  has_many :replacements
  belongs_to :schedule

end
