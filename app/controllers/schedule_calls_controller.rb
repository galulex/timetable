class ScheduleCallsController < ApplicationController

  before_filter :find_schedule

  def index
    @schedule_calls = @schedule.schedule_calls
  end

  def new
    @object = ScheduleCall.new
    render 'shared/new'
  end

  def create
    @object = @schedule.schedule_calls.create(params[:schedule_call])
    render 'shared/create'
  end

  def edit
    @object = @schedule.schedule_calls.find(params[:id])
    render 'shared/edit'
  end

  def update
    @object = @schedule.schedule_calls.find(params[:id])
    @object.update_attributes(params[:schedule_call]) unless @schedule.published?
    render 'shared/update'
  end

  def destroy
    @object = @schedule.schedule_calls.find(params[:id])
    @object.destroy
    render 'shared/destroy'
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
