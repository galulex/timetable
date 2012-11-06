require 'spec_helper'

describe Replacement do

  let(:replacement) { FactoryGirl.build(:replacement) }

  context 'validations' do

    it 'should be valid' do
      replacement.should be_valid
    end

    it 'should not create replacement without name' do
      replacement.name = nil
      replacement.save
      replacement.errors[:name].should_not be_blank
    end

    it 'should not create replacement without date' do
      replacement.date = nil
      replacement.save
      replacement.errors[:date].should_not be_blank
    end

    it 'should not create replacement without teacher_id' do
      replacement.teacher_id = nil
      replacement.save
      replacement.errors[:teacher_id].should_not be_blank
    end

    it 'should not create replacement without day_id' do
      replacement.day_id = nil
      replacement.save
      replacement.errors[:day_id].should_not be_blank
    end

    it 'should not create replacement without schedule_id' do
      replacement.schedule_id = nil
      replacement.save
      replacement.errors[:schedule_id].should_not be_blank
    end

    it 'should not create replacement without schedule_call_id' do
      replacement.schedule_call_id = nil
      replacement.save
      replacement.errors[:schedule_call_id].should_not be_blank
    end

    it 'should not create replacement without group_id' do
      replacement.group_id = nil
      replacement.save
      replacement.errors[:group_id].should_not be_blank
    end

    it 'should not create replacement without audience_id' do
      replacement.audience_id = nil
      replacement.save
      replacement.errors[:audience_id].should_not be_blank
    end

  end

end
