require 'spec_helper'

describe Dispatcher do

  let(:dispatcher) { FactoryGirl.build(:dispatcher) }

  context 'validations' do

    it 'should be valid' do
      dispatcher.should be_valid
    end

    it 'should not create without password' do
      dispatcher.password = nil
      dispatcher.save
      dispatcher.errors[:password].should_not be_blank
    end

  end

end
