require 'spec_helper'

describe SessionsController do

  let(:dispatcher) { Factory.create(:dispatcher) }

  it 'should get new' do
    get :new, :format => :js
    response.should be_success
    flash.should be_blank
    response.should render_template :new
  end

  describe 'post create' do
    it 'should create a session' do
      post :create, :email => dispatcher.email, :password => dispatcher.password, :format => :js
      assigns[:user].should_not be_nil
      assigns[:user].errors.should be_blank
      response.should redirect_to schedules_path
    end

    it 'should not create a session' do
      post :create, :email => dispatcher.email, :password => '', :format => :js
      assigns[:user].should_not be_nil
      response.should render_template :new
    end
  end

  it 'should destroy session' do
    delete :destroy
    flash.should be_blank
    session[:user_id].should be_nil
    response.should redirect_to root_path
  end

end
