class Institution < ActiveRecord::Base

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  belongs_to :dispatcher
  has_many :schedules
  has_many :groups, through: :schedules

end
