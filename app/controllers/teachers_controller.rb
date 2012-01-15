class TeachersController < ApplicationController

  before_filter :find_schedule

  def index
    @teachers = @schedule.teachers
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = @schedule.teachers.create(params[:teacher])
  end

  def edit
    @teacher = @schedule.teachers.find(params[:id])
    render :action => :new
  end

  def update
    @teacher = @schedule.teachers.find(params[:id])
    @teacher.update_attributes(params[:teacher])
    render :action => :create
  end

  def destroy
    @teacher = @schedule.teachers.find(params[:id])
    @teacher.destroy
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
