class AudiencesController < ApplicationController

  before_filter :find_schedule

  def index
    @audiences = @schedule.audiences
  end

  def new
    @audience = Audience.new
  end

  def create
    @audience = @schedule.audiences.create(params[:audience])
  end

  def edit
    @audience = @schedule.audiences.find(params[:id])
    render :action => :new
  end

  def update
    @audience = @schedule.audiences.find(params[:id])
    @audience.update_attributes(params[:audience]) unless @schedule.published?
    render :action => :create
  end

  def destroy
    @audience = @schedule.audiences.find(params[:id])
    @audience.destroy
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
