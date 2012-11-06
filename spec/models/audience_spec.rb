require 'spec_helper'

describe Audience do

  let(:audience) { FactoryGirl.build(:audience) }

  context 'validations' do

    it 'should be valid' do
      audience.should be_valid
    end

    it 'should not create audience without title' do
      audience.title = nil
      audience.save
      audience.errors[:title].should_not be_blank
    end

  end

end
