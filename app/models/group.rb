class Group < ActiveRecord::Base

  validates :name, :presence => true

  has_many :lessons, :dependent => :delete_all
  belongs_to :teacher

end
