class LessonsController < ApplicationController

  before_filter :find_schedule

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @schedule.lessons.create(params[:lesson])
  end

  def edit
    @lesson = @schedule.lessons.find(params[:id])
    render :action => :new
  end

  def update
    @lesson = @schedule.lessons.find(params[:id])
    @lesson.update_attributes(params[:lesson])
    render :action => :create
  end

  def destroy
    @lesson = @schedule.lessons.find(params[:id])
    @lesson.destroy
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
