class Schedule < ActiveRecord::Base

  validates :title, :presence => true

  belongs_to :dispatcher

end
