class GroupsController < ApplicationController

  before_filter :find_schedule

  def index
    @groups = @schedule.groups
  end

  def new
    @object = Group.new
    render 'shared/new'
  end

  def create
    @object = @schedule.groups.create(params[:group])
    render 'shared/create'
  end

  def edit
    @object = @schedule.groups.find(params[:id])
    render 'shared/edit'
  end

  def update
    @object = @schedule.groups.find(params[:id])
    @object.update_attributes(params[:group]) unless @schedule.published?
    render 'shared/update'
  end

  def destroy
    @object = @schedule.groups.find(params[:id])
    @object.destroy
    render 'shared/destroy'
  end

  private

  def find_schedule
    @schedule = current_user.schedules.find(params[:schedule_id])
  end

end
