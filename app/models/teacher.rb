class Teacher < ActiveRecord::Base

  validates :first_name, :last_name, :presence => true

  has_many :lessons
  belongs_to :schedule

end
