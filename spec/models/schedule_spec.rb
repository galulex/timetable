require 'spec_helper'

describe Schedule do

  let(:schedule) { Factory.build(:schedule) }

  context 'validations' do

    it 'should be valid' do
      schedule.should be_valid
    end

    it 'should not create schedule_call without title' do
      schedule.title = nil
      schedule.save
      schedule.errors[:title].should_not be_blank
    end

  end

  context 'methods' do

    it 'should return days' do
      schedule.days.should_not be_nil
    end

  end

end
