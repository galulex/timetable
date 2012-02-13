require 'spec_helper'

describe Institution do

  let(:institution) { Factory.build(:institution) }

  context 'validations' do

    it 'should not create institution without name' do
      institution.name = nil
      institution.save
      institution.errors[:name].should_not be_blank
    end

    it 'should not create institution with existing name' do
      institution.name = nil
      institution.save
      i = institution.clone
      i.save
      i.errors[:name].should_not be_blank
    end

  end
end
