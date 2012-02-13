require 'spec_helper'

describe Group do

  let(:group) { Factory.build(:group) }

  context 'validations' do

    it 'should not create group without name' do
      group.name = nil
      group.save
      group.errors[:name].should_not be_blank
    end

  end

end
