class SchedulesController < ApplicationController

  def index
    @schedules = current_user.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.create(params[:schedule].merge({ :institution_id => current_user.id }))
  end

  def show
    @schedule = current_user.schedules.find(params[:id])
    @lessons = @schedule.lessons.for_day(params[:day_id])
    @replacements = @schedule.replacements.for_day(params[:day_id])
    @days = @schedule.days
    @days = { params[:day_id] => @days[params[:day_id].to_i] } if params[:day_id]
    @table_width = (@schedule.groups.size * 250) + 105 + 60
  end

  def print
    @schedule = current_user.schedules.find(params[:id])
    @lessons = @schedule.lessons.for_day(params[:day_id])
    @days = @schedule.days
    @table_width = (@schedule.groups.size * 250) + 105 + 60
    render :layout => 'print'
  end

  def update
    @schedule = current_user.schedules.find(params[:id])
    @schedule.update_attribute(:published, !@schedule.published?) unless params[:schedule]
    redirect_to schedule_path(@schedule)
  end

  def destroy
    @schedule = current_user.schedules.find(params[:id])
    @schedule.destroy
  end

end
