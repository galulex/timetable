require 'spec_helper'

describe ScheduleCall do

  let(:schedule_call) { FactoryGirl.build(:schedule_call) }

  context 'validations' do

    it 'should be valid' do
      schedule_call.should be_valid
    end

    it 'should not create schedule_call without start_at' do
      schedule_call.start_at = nil
      schedule_call.save
      schedule_call.errors[:start_at].should_not be_blank
    end

  end

  context 'methods' do

    it 'should return finish_at' do
      schedule_call.finish_at.should eq(schedule_call.start_at + schedule_call.schedule.lesson_duration.to_i)
    end

    it 'should return time' do
      schedule_call.time.should_not be_nil
    end

  end

end
