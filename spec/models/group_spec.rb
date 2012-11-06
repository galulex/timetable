require 'spec_helper'

describe Group do

  let(:group) { FactoryGirl.build(:group) }

  context 'validations' do

    it 'should be valid' do
      group.should be_valid
    end

    it 'should not create group without name' do
      group.name = nil
      group.save
      group.errors[:name].should_not be_blank
    end

  end

end
