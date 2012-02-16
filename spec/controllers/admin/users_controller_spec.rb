require 'spec_helper'

describe Admin::UsersController do

  let(:dispatcher) { Factory.create(:dispatcher) }

  before do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:admin")
  end

  it 'should get index' do
    get :index
    response.should be_success
    flash.should be_blank
    assigns[:users].should_not be_nil
    response.should render_template :index
  end

  it 'should approve users' do
    put :update, :user_ids => dispatcher.id
    flash.should be_blank
    assigns[:users].should_not be_nil
    response.should redirect_to admin_users_path
  end

end
