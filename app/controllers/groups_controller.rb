class GroupsController < ApplicationController

  before_filter :find_schedule

  def index
    @groups = @schedule.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = @schedule.groups.create(params[:group])
  end

  def edit
    @group = @schedule.groups.find(params[:id])
    render :action => :new
  end

  def update
    @group = @schedule.groups.find(params[:id])
    @group.update_attributes(params[:group])
    render :action => :create
  end

  def destroy
    @group = @schedule.groups.find(params[:id])
    @group.destroy
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
