require 'spec_helper'

describe TeachersController do

  let(:dispatcher) { FactoryGirl.create(:dispatcher) }
  let(:schedule) { FactoryGirl.create(:schedule, :dispatcher => dispatcher) }
  let(:teacher) { FactoryGirl.create(:teacher, :schedule => schedule) }
  let(:valid_params) { FactoryGirl.build(:teacher).attributes }
  let(:invalid_params) { FactoryGirl.build(:teacher, :first_name => '').attributes }

  before(:each) do
    controller.stub(:current_user).and_return(dispatcher)
  end

  it 'should get index' do
    get :index, :schedule_id => schedule.id
    response.should be_success
    flash.should be_blank
    assigns[:teachers].should_not be_nil
    response.should render_template :index
  end

  it 'should get new' do
    get :new, :schedule_id => schedule.id, :format => :js
    response.should be_success
    flash.should be_blank
    assigns[:object].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create a teacher' do
      post :create, :schedule_id => schedule.id, :format => :js, :teacher => valid_params
      assigns[:object].should_not be_nil
      assigns[:object].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create a teacher' do
      post :create, :schedule_id => schedule.id, :format => :js, :teacher => invalid_params
      assigns[:object].should_not be_nil
      assigns[:object].errors.should_not be_blank
      response.should render_template :create
    end

  it 'should get edit' do
    get :edit, :schedule_id => schedule.id, :id => teacher.id, :format => :js
    response.should be_success
    assigns[:object].should_not be_nil
    response.should render_template :edit
  end

  describe 'put update' do
    it 'should update the teacher' do
      put :update, :schedule_id => schedule.id, :id => teacher.id, :teacher => valid_params, :format => :js
      assigns[:object].errors.should be_blank
      response.should render_template :update
    end
    it 'should not update the teacher' do
      put :update, :schedule_id => schedule.id, :id => teacher.id, :teacher => invalid_params, :format => :js
      assigns[:object].errors.should_not be_blank
      response.should render_template :update
    end
  end

  it 'should destroy the teacher' do
    delete :destroy, :schedule_id => schedule.id, :id => teacher.id, :format => :js
    assigns[:object].should_not be_nil
    response.should render_template :destroy
  end

end
