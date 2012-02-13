require 'spec_helper'

describe Audience do

  let(:audience) { Factory.build(:audience) }

  context 'validations' do

    it 'should not create audience without title' do
      audience.title = nil
      audience.save
      audience.errors[:title].should_not be_blank
    end

  end

end
