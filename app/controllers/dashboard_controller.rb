class DashboardController < ApplicationController

  def show
    if params[:search]
      @schedule = Schedule.includes(:lessons, :groups).where('schedules.institution_id' == params[:search][:institution_id]).first
      @schedule.groups.delete_if{ |g| g.id != params[:search][:group_id].to_i } if params[:search][:group_id]
      @lessons = @schedule.lessons
      @days = @schedule.days
      @table_width = (@schedule.groups.size * 250) + 105 + 60 + 20
    end
  end

end
