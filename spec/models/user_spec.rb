require 'spec_helper'

describe User do

  let(:user) { Factory.build(:dispatcher) }

  context 'methods' do

    it 'should return name' do
      user.name.should eq("#{user.first_name} #{user.last_name}")
    end

  end

end
