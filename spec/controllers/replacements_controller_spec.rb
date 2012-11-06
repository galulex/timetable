require 'spec_helper'

describe ReplacementsController do

  let(:dispatcher) { FactoryGirl.create(:dispatcher) }
  let(:schedule) { FactoryGirl.create(:schedule, :dispatcher => dispatcher) }
  let(:replacement) { FactoryGirl.create(:replacement, :schedule => schedule) }
  let(:valid_params) { FactoryGirl.build(:replacement).attributes }
  let(:invalid_params) { FactoryGirl.build(:replacement, :name => '').attributes }

  before(:each) do
    controller.stub(:current_user).and_return(dispatcher)
  end

  it 'should get new' do
    get :new, :schedule_id => schedule.id, :format => :js
    response.should be_success
    flash.should be_blank
    assigns[:replacement].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create a replacement' do
      post :create, :schedule_id => schedule.id, :format => :js, :replacement => valid_params
      assigns[:replacement].should_not be_nil
      assigns[:replacement].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create a replacement' do
      post :create, :schedule_id => schedule.id, :format => :js, :replacement => invalid_params
      assigns[:replacement].should_not be_nil
      assigns[:replacement].errors.should_not be_blank
      response.should render_template :create
    end

  it 'should get edit' do
    get :edit, :schedule_id => schedule.id, :id => replacement.id, :format => :js
    response.should be_success
    assigns[:replacement].should_not be_nil
    response.should render_template :new
  end

  describe 'put update' do
    it 'should update the replacement' do
      put :update, :schedule_id => schedule.id, :id => replacement.id, :replacement => valid_params, :format => :js
      assigns[:replacement].errors.should be_blank
      response.should render_template :create
    end
    it 'should not update the replacement' do
      put :update, :schedule_id => schedule.id, :id => replacement.id, :replacement => invalid_params, :format => :js
      assigns[:replacement].errors.should_not be_blank
      response.should render_template :create
    end
  end

  it 'should destroy the replacement' do
    delete :destroy, :schedule_id => schedule.id, :id => replacement.id, :format => :js
    assigns[:replacement].should_not be_nil
    response.should render_template :destroy
  end

end
