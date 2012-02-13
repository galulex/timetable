require 'spec_helper'

describe Teacher do

  let(:teacher) { Factory.build(:teacher) }

  context 'validations' do

    it 'should not create teacher without first_name' do
      teacher.first_name = nil
      teacher.save
      teacher.errors[:first_name].should_not be_blank
    end

    it 'should not create teacher without last_name' do
      teacher.last_name = nil
      teacher.save
      teacher.errors[:last_name].should_not be_blank
    end

    it 'should not create teacher without invalid hours' do
      teacher.hours = 'hours'
      teacher.save
      teacher.errors[:hours].should_not be_blank
    end

  end

  context 'methods' do

    it 'should return name' do
      teacher.name.should eq("#{teacher.first_name} #{teacher.last_name}")
    end

  end

end
