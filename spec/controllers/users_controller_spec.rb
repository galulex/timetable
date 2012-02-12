require 'spec_helper'

describe UsersController do

  let(:dispatcher_params) { Factory.build(:dispatcher).attributes.merge(:password => 'PassWord2012', :password_confiramtion => 'PassWord2012') }
  let(:dispatcher) { Factory.create(:dispatcher) }


  it 'should get new' do
    get :new
    response.should be_success
    flash.should be_blank
    assigns[:dispatcher].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create new dispatcher' do
      post :create, :format => :js, :dispatcher => dispatcher_params
      flash[:notice].should_not be_blank
      assigns[:dispatcher].should_not be_nil
      assigns[:dispatcher].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create new dispatcher' do
      post :create, :format => :js, :dispatcher => dispatcher_params.delete(:email)
      flash.should be_blank
      assigns[:dispatcher].should_not be_nil
      assigns[:dispatcher].errors.should_not be_blank
      response.should render_template :create
    end

  describe 'get edit' do
    it 'should activate user' do
      get :edit, :id => dispatcher.token
      assigns[:dispatcher].should_not be_nil
      flash[:notice].should_not be_blank
      response.should redirect_to root_path
    end
    it 'should not activate user' do
      get :edit, :id => 0
      flash.should be_blank
      assigns[:dispatcher].should be_nil
      response.should redirect_to root_path
    end
  end

  describe 'put update' do
    before(:each) do
      controller.stub(:current_user).and_return(dispatcher)
    end
    it 'should update user' do
      put :update, :format => :js, :id => dispatcher.id, :dispatcher => dispatcher_params.delete('password')
      assigns[:dispatcher].errors.should be_blank
      response.should render_template :update
    end
    it 'should not activate user' do
      put :update, :format => :js, :id => dispatcher.id, :dispatcher => {:first_name => ''}
      assigns[:dispatcher].errors.should_not be_blank
      response.should render_template :update
    end
  end
end
