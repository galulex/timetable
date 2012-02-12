require 'spec_helper'

describe SchedulesController do

  let(:dispatcher) { Factory.create(:dispatcher) }
  let(:schedule) { Factory.create(:schedule, :dispatcher => dispatcher) }
  let(:valid_params) { Factory.build(:schedule).attributes }
  let(:invalid_params) { Factory.build(:schedule, :title => '').attributes }

  before(:each) do
    controller.stub(:current_user).and_return(dispatcher)
  end

  it 'should get index' do
    get :index
    response.should be_success
    flash.should be_blank
    assigns[:schedules].should_not be_nil
    response.should render_template :index
  end

  it 'should get new' do
    get :new, :format => :js
    response.should be_success
    flash.should be_blank
    assigns[:schedule].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create an schedule' do
      post :create, :schedule => valid_params, :format => :js
      assigns[:schedule].should_not be_nil
      assigns[:schedule].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create an schedule' do
      post :create, :schedule => invalid_params, :format => :js
      assigns[:schedule].should_not be_nil
      assigns[:schedule].errors.should_not be_blank
      response.should render_template :create
    end

  describe 'put update' do
    it 'should punlish the schedule' do
      put :update, :schedule_id => schedule.id, :id => schedule.id
      assigns[:schedule].errors.should be_blank
      assigns[:schedule].published?.should be_true
      response.should redirect_to schedule_path(assigns[:schedule])
    end
    it 'should unpublish the schedule' do
      schedule.update_attributes(:published => true)
      put :update, :schedule_id => schedule.id, :id => schedule.id
      assigns[:schedule].errors.should be_blank
      assigns[:schedule].published?.should be_false
      response.should redirect_to schedule_path(assigns[:schedule])
    end
  end

  it 'should destroy the schedule' do
    delete :destroy, :schedule_id => schedule.id, :id => schedule.id
    assigns[:schedule].should_not be_nil
    response.should redirect_to schedules_path 
  end

end
