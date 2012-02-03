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
    @lessons = @schedule.lessons.for_day(params[:day_id])
    @days = @schedule.days
    @days = { params[:day_id] => @days[params[:day_id].to_i] } if params[:day_id]
  end

  def update
    @schedule = current_user.schedules.find(params[:id])
    @schedule.update_attribute(:published, !@schedule.published?) unless params[:schedule]
    redirect_to schedule_path(@schedule)
  end

end
