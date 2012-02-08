class TeachersController < ApplicationController

  before_filter :find_schedule

  def index
    @teachers = @schedule.teachers
  end

  def new
    @object = Teacher.new
    render 'shared/new'
  end

  def create
    @object = @schedule.teachers.create(params[:teacher])
    render 'shared/create'
  end

  def edit
    @object = @schedule.teachers.find(params[:id])
    render 'shared/edit'
  end

  def update
    @object = @schedule.teachers.find(params[:id])
    @object.update_attributes(params[:teacher]) unless @schedule.published?
    render 'shared/update'
  end

  def destroy
    @object = @schedule.teachers.find(params[:id])
    @object.destroy
    render 'shared/destroy'
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
