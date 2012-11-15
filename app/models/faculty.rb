class Faculty < ActiveRecord::Base
  attr_accessible :schedule_id, :title

  belongs_to :schedule
  has_many :group
end
