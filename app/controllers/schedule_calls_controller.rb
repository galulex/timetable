class ScheduleCallsController < ApplicationController

  before_filter :find_schedule

  def index
    @schedule_calls = @schedule.schedule_calls
  end

  def new
    @schedule_call = ScheduleCall.new
  end

  def create
    @schedule_call = @schedule.schedule_calls.create(params[:schedule_call])
  end

  def edit
    @schedule_call = @schedule.schedule_calls.find(params[:id])
    render :action => :new
  end

  def update
    @schedule_call = @schedule.schedule_calls.find(params[:id])
    @schedule_call.update_attributes(params[:schedule_call])
    render :action => :create
  end

  def destroy
    @schedule_call = @schedule.schedule_calls.find(params[:id])
    @schedule_call.destroy
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
