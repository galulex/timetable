class Schedule < ActiveRecord::Base

  validates :title, :presence => true

  has_many :teachers
  has_many :audiences
  has_many :groups
  has_many :lessons
  belongs_to :dispatcher

end
