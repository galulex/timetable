class DashboardController < ApplicationController

  def show
    if params[:institution]
      @schedule = Schedule.find_by_institution_id(params[:institution], :include => :lessons)
      @lessons = @schedule.lessons
      @days = @schedule.days
      @table_width = (@schedule.groups.size * 250) + 105 + 60 + 20
    end
  end

end
