class LessonsController < ApplicationController

  before_filter :find_schedule

  def new
    @lesson = Lesson.new(:group_id => params[:group_id], :day_id => params[:day_id], :schedule_call_id => params[:schedule_call_id])
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
    redirect_to schedule_path(@schedule)
  end

  def copy
    session[:lesson_id] = params[:id]
    redirect_to schedule_path(@schedule)
  end

  def paste
    unless session[:lesson_id].nil?
      old_lesson = Lesson.find(session[:lesson_id])
      new_lesson = Lesson.new do |l|
        l.group_id = params[:group_id]
        l.day_id = params[:day_id]
        l.schedule_call_id = params[:schedule_call_id]
        l.schedule_id = params[:schedule_id]
        l.name = old_lesson[:name]
        l.teacher_id = old_lesson[:teacher_id]
        l.audience_id = old_lesson[:audience_id]
      end
      new_lesson.save
    end
    redirect_to schedule_path(@schedule)
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
