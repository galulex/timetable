require 'spec_helper'

describe LessonsController do

  let(:dispatcher) { Factory.create(:dispatcher) }
  let(:schedule) { Factory.create(:schedule, :dispatcher => dispatcher) }
  let(:lesson) { Factory.create(:lesson, :schedule => schedule) }
  let(:valid_params) { Factory.build(:lesson).attributes }
  let(:invalid_params) { Factory.build(:lesson, :name => '').attributes }

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

  describe 'post create'
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
      response.should render_template :create
    end
    it 'should not update the lesson' do
      put :update, :schedule_id => schedule.id, :id => lesson.id, :lesson => invalid_params, :format => :js
      assigns[:lesson].errors.should_not be_blank
      response.should render_template :create
    end
  end

  it 'should destroy the lesson' do
    delete :destroy, :schedule_id => schedule.id, :id => lesson.id, :format => :js
    assigns[:lesson].should_not be_nil
    response.should render_template :destroy
  end

end
