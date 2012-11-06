require 'spec_helper'

describe Student do

  let(:student) { FactoryGirl.build(:student) }

  context 'validations' do

    it 'should be valid' do
      student.should be_valid
    end

    it 'should not create without facebook_id' do
      student.facebook_id = nil
      student.save
      student.errors[:facebook_id].should_not be_blank
    end

  end

  context 'methods' do

    it 'should return existing student' do
      user = Student.authenticate(student.attributes, student.token)
      user.should_not be_nil
    end

    it 'should return created student' do
      user = Student.authenticate({}, '0')
      user.should_not be_nil
    end

  end

end
