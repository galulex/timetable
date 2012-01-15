class Teacher < ActiveRecord::Base

  validates :first_name, :last_name, :presence => true
  validates :hours, :numericality => true

  has_many :lessons
  has_many :groups
  belongs_to :schedule

  def name
    "#{first_name} #{last_name}"
  end

end
