class SchedulesController < ApplicationController

  def index
    @schedules = current_user.schedules
  end

end
