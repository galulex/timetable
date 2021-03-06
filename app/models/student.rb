class Student < User

  validates :facebook_id, :presence => true, :uniqueness => true
  attr_accessible :facebook_id

  def self.authenticate(info, token)
    attrs = info.reject{|k,v| !self.new.attributes.keys.member?(k.to_s) }
    attrs['facebook_id'] = info['id']
    student = find_by_facebook_id(info['id'])
    if student
      student.update_attributes(attrs)
    else
      student = create(attrs)
    end
    student
  end

end
