require 'spec_helper'

describe AdminController do

  before do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:admin")
  end

  it 'should get show' do
    get :show
    response.should be_success
    flash.should be_blank
    response.should render_template :show
  end

end
