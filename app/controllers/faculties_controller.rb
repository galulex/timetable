class FacultiesController < ApplicationController

  before_filter :find_schedule

  def index
    @faculties = @schedule.faculties
  end

  def new
    @object = Faculty.new
    render 'shared/new'
  end

  def create
    @object = @schedule.faculties.create(params[:faculty])
    render 'shared/create'
  end

  def edit
    @object = @schedule.faculties.find(params[:id])
    render 'shared/edit'
  end

  def update
    @object = @schedule.faculties.find(params[:id])
    @object.update_attributes(params[:faculty]) unless @schedule.published?
    render 'shared/update'
  end

  def destroy
    @object = @schedule.faculties.find(params[:id])
    @object.destroy
    render 'shared/destroy'
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
