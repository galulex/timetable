class AdminController < ApplicationController

   http_basic_authenticate_with :name => CONFIG['admin']['name'], :password => CONFIG['admin']['name']

  def show

  end

end
