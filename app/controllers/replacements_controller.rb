class ReplacementsController < ApplicationController

  before_filter :find_schedule

  def new
    @replacement = Replacement.new(:group_id => params[:group_id], :day_id => params[:day_id], :schedule_call_id => params[:schedule_call_id], :lesson_id => params[:lesson_id])
  end

  def create
    @replacement = @schedule.replacements.create(params[:replacement])
    #send_notifications
  end

  def edit
    @replacement = @schedule.replacements.find(params[:id])
    render :action => :new
  end

  def update
    @replacement = @schedule.replacements.find(params[:id])
    @replacement.update_attributes(params[:replacement])
    render :action => :create
  end

  def destroy
    @replacement = @schedule.replacements.find(params[:id])
    @replacement.destroy
    redirect_to schedule_path(@schedule)
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
