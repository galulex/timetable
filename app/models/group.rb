class Group < ActiveRecord::Base

  validates :name, :presence => true

  has_many :lessons
  belongs_to :teacher

end
