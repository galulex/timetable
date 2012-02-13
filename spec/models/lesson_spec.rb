require 'spec_helper'

describe Lesson do

  let(:lesson) { Factory.build(:lesson) }

  context 'validations' do

    it 'should not create lesson without name' do
      lesson.name = nil
      lesson.save
      lesson.errors[:name].should_not be_blank
    end

    it 'should not create lesson without teacher_id' do
      lesson.teacher_id = nil
      lesson.save
      lesson.errors[:teacher_id].should_not be_blank
    end

    it 'should not create lesson without day_id' do
      lesson.day_id = nil
      lesson.save
      lesson.errors[:day_id].should_not be_blank
    end

    it 'should not create lesson without schedule_id' do
      lesson.schedule_id = nil
      lesson.save
      lesson.errors[:schedule_id].should_not be_blank
    end

    it 'should not create lesson without schedule_call_id' do
      lesson.schedule_call_id = nil
      lesson.save
      lesson.errors[:schedule_call_id].should_not be_blank
    end

    it 'should not create lesson without group_id' do
      lesson.group_id = nil
      lesson.save
      lesson.errors[:group_id].should_not be_blank
    end

    it 'should not create lesson without audience_id' do
      lesson.audience_id = nil
      lesson.save
      lesson.errors[:audience_id].should_not be_blank
    end

  end

end
