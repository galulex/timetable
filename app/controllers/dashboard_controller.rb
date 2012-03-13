class DashboardController < ApplicationController

  def show
    if params[:institution]
      @schedule = Schedule.find_by_institution_id(params[:institution], :include => :lessons)
      @lessons = @schedule.lessons.for_group(params[:group], :include => :replacement)
    end
  end

end
