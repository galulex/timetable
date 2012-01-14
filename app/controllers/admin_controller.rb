class AdminController < ApplicationController

  http_basic_authenticate_with :name => "admin", :password => "timetable2012"

  def show

  end
end
