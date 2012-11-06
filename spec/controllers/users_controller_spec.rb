require 'spec_helper'

describe UsersController do

  let(:user_params) { FactoryGirl.build(:dispatcher).attributes.merge(:password => 'PassWord2012', :password_confiramtion => 'PassWord2012') }
  let(:user) { FactoryGirl.create(:dispatcher) }


  it 'should get new' do
    get :new
    response.should be_success
    flash.should be_blank
    assigns[:user].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create new user' do
      post :create, :format => :js, :dispatcher => user_params
      flash[:notice].should_not be_blank
      assigns[:user].should_not be_nil
      assigns[:user].errors.should be_blank
      response.should render_template :create
    end

    it 'should not create new user' do
      post :create, :format => :js, :dispatcher => user_params.delete(:email)
      flash.should be_blank
      assigns[:user].should_not be_nil
      assigns[:user].errors.should_not be_blank
      response.should render_template :create
    end

  describe 'get edit' do
    it 'should activate user' do
      get :edit, :id => user.token
      assigns[:user].should_not be_nil
      flash[:notice].should_not be_blank
      response.should redirect_to root_path
    end
    it 'should not activate user' do
      get :edit, :id => 0
      flash.should be_blank
      assigns[:user].should be_nil
      response.should redirect_to root_path
    end
  end

  describe 'put update' do
    before(:each) do
      controller.stub(:current_user).and_return(user)
    end
    it 'should update user' do
      put :update, :format => :js, :id => user.id, :dispatcher => user_params.delete('password')
      assigns[:user].errors.should be_blank
      response.should render_template :update
    end
    it 'should not activate user' do
      put :update, :format => :js, :id => user.id, :dispatcher => {:first_name => ''}
      assigns[:user].errors.should_not be_blank
      response.should render_template :update
    end
  end
end
