require 'spec_helper'

describe GroupsController do

  let(:dispatcher) { FactoryGirl.create(:dispatcher) }
  let(:schedule) { FactoryGirl.create(:schedule, :dispatcher => dispatcher) }
  let(:group) { FactoryGirl.create(:group, :schedule => schedule) }
  let(:valid_params) { FactoryGirl.build(:group).attributes }
  let(:invalid_params) { FactoryGirl.build(:group, :name => '').attributes }

  before(:each) do
    controller.stub(:current_user).and_return(dispatcher)
  end

  it 'should get index' do
    get :index, :schedule_id => schedule.id
    response.should be_success
    flash.should be_blank
    assigns[:groups].should_not be_nil
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
    it 'should create a group' do
      post :create, :schedule_id => schedule.id, :format => :js, :group => valid_params
      assigns[:object].should_not be_nil
      assigns[:object].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create a group' do
      post :create, :schedule_id => schedule.id, :format => :js, :group => invalid_params
      assigns[:object].should_not be_nil
      assigns[:object].errors.should_not be_blank
      response.should render_template :create
    end

  it 'should get edit' do
    get :edit, :schedule_id => schedule.id, :id => group.id, :format => :js
    response.should be_success
    assigns[:object].should_not be_nil
    response.should render_template :edit
  end

  describe 'put update' do
    it 'should update the group' do
      put :update, :schedule_id => schedule.id, :id => group.id, :group => valid_params, :format => :js
      assigns[:object].errors.should be_blank
      response.should render_template :update
    end
    it 'should not update the group' do
      put :update, :schedule_id => schedule.id, :id => group.id, :group => invalid_params, :format => :js
      assigns[:object].errors.should_not be_blank
      response.should render_template :update
    end
  end

  it 'should destroy the group' do
    delete :destroy, :schedule_id => schedule.id, :id => group.id, :format => :js
    assigns[:object].should_not be_nil
    response.should render_template :destroy
  end

end
