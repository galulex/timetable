require 'spec_helper'

describe Dispatcher do

  let(:dispatcher) { Factory.build(:dispatcher) }

  context 'validations' do

    it 'should be valid' do
      dispatcher.should be_valid
    end

    it 'should not create without password' do
      dispatcher.password = nil
      dispatcher.save
      dispatcher.errors[:password].should_not be_blank
    end

    it 'should not create without first_name' do
      dispatcher.first_name = nil
      dispatcher.save
      dispatcher.errors[:first_name].should_not be_blank
    end

    it 'should not create without last_name' do
      dispatcher.last_name = nil
      dispatcher.save
      dispatcher.errors[:last_name].should_not be_blank
    end

    it 'should not create without email' do
      dispatcher.email = nil
      dispatcher.save
      dispatcher.errors[:email].should_not be_blank
    end

    it 'should not create with invalid email' do
      dispatcher.email = 'email'
      dispatcher.save
      dispatcher.errors[:email].should_not be_blank
    end

  end

  context 'methods' do

    it 'should not return user' do
      user = Dispatcher.authenticate(dispatcher.email, 'pass')
      user.should be_nil
    end

  end

end
