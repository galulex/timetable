require 'spec_helper'

describe LessonsController do

  let(:dispatcher) { FactoryGirl.create(:dispatcher) }
  let(:schedule) { FactoryGirl.create(:schedule, :dispatcher => dispatcher) }
  let(:lesson) { FactoryGirl.create(:lesson, :schedule => schedule) }
  let(:valid_params) { FactoryGirl.build(:lesson).attributes }
  let(:invalid_params) { FactoryGirl.build(:lesson, :name => '').attributes }

  before(:each) do
    controller.stub(:current_user).and_return(dispatcher)
  end

  it 'should get new' do
    get :new, :schedule_id => schedule.id, :format => :js
    response.should be_success
    flash.should be_blank
    assigns[:lesson].should_not be_nil
    response.should render_template :new
  end

  describe 'post create' do
    it 'should create a lesson' do
      post :create, :schedule_id => schedule.id, :format => :js, :lesson => valid_params
      assigns[:lesson].should_not be_nil
      assigns[:lesson].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create a lesson' do
      post :create, :schedule_id => schedule.id, :format => :js, :lesson => invalid_params
      assigns[:lesson].should_not be_nil
      assigns[:lesson].errors.should_not be_blank
      response.should render_template :create
    end
  end

  it 'should get edit' do
    get :edit, :schedule_id => schedule.id, :id => lesson.id, :format => :js
    response.should be_success
    assigns[:lesson].should_not be_nil
    response.should render_template :new
  end

  describe 'put update' do
    it 'should update the lesson' do
      put :update, :schedule_id => schedule.id, :id => lesson.id, :lesson => valid_params, :format => :js
      assigns[:lesson].errors.should be_blank
      response.should render_template :update
    end
    it 'should not update the lesson' do
      put :update, :schedule_id => schedule.id, :id => lesson.id, :lesson => invalid_params, :format => :js
      assigns[:lesson].errors.should_not be_blank
      response.should render_template :update
    end
  end

  it 'should destroy the lesson' do
    delete :destroy, :schedule_id => schedule.id, :id => lesson.id, :format => :js
    assigns[:lesson].should_not be_nil
    response.should render_template :destroy
  end

  it 'should copy the lesson' do
    get :copy, :schedule_id => schedule.id, :id => lesson.id
    response.should redirect_to(schedule_path(assigns[:schedule]))
  end

  describe 'post paste' do
    it 'should create a lesson' do
      session[:lesson_id] = lesson.id
      post :paste, :schedule_id => schedule.id, :day_id => lesson.day_id, :schedule_call_id => lesson.schedule_call_id, :group_id => lesson.group_id, :format => :js
      assigns[:lesson].should_not be_nil
      assigns[:lesson].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create a lesson' do
      post :paste, :schedule_id => schedule.id, :format => :js
      assigns[:lesson].should be_nil
      response.should render_template :create
    end
  end

end
