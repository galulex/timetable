class SchedulesController < ApplicationController

  def index
    @schedules = current_user.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.create(params[:schedule])
  end

  def show
    @schedule = current_user.schedules.find(params[:id])
  end

end
