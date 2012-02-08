class AudiencesController < ApplicationController

  before_filter :find_schedule

  def index
    @audiences = @schedule.audiences
  end

  def new
    @object = Audience.new
    render 'shared/new'
  end

  def create
    @object = @schedule.audiences.create(params[:audience])
    render 'shared/create'
  end

  def edit
    @object = @schedule.audiences.find(params[:id])
    render 'shared/edit'
  end

  def update
    @object = @schedule.audiences.find(params[:id])
    @object.update_attributes(params[:audience]) unless @schedule.published?
    render 'shared/update'
  end

  def destroy
    @object = @schedule.audiences.find(params[:id])
    @object.destroy
    render 'shared/destroy'
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
