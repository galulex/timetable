require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.build(:dispatcher) }

  context 'validations' do

    it 'should be valid' do
      user.should be_valid
    end

    it 'should not create without first_name' do
      user.first_name = nil
      user.save
      user.errors[:first_name].should_not be_blank
    end

    it 'should not create without last_name' do
      user.last_name = nil
      user.save
      user.errors[:last_name].should_not be_blank
    end

    it 'should not create without email' do
      user.email = nil
      user.save
      user.errors[:email].should_not be_blank
    end

    it 'should not create with invalid email' do
      user.email = 'email'
      user.save
      user.errors[:email].should_not be_blank
    end
  end

  context 'methods' do

    it 'should return name' do
      user.name.should eq("#{user.first_name} #{user.last_name}")
    end

  end

end
