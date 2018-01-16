class WelcomeController < ApplicationController
  respond_to :html, :js, :json

  def index
    @projects_featured = Project.includes(:areas).featured
    @project_urgent = Project.urgent.limit(1)
    @locations = Event.includes(:address).where(eventable_type: Project.name).as_json(only: [:id], include: { address: { only: [:latitude, :longitude] } })
    params[:day] ||= Time.now
    @search_q = Timetable.select('execution_date, activities.id').joins(:activity).order(:execution_date).group('execution_date, activities.id').search(execution_date_gteq: Time.now)
    @events = @search_q.result.limit(2)
    @list_days = Activity.includes(:timetables).distinct.activities_present(Time.now).order('timetables.execution_date').pluck('timetables.execution_date').to_json

    respond_to do |format|
      format.html
      format.js
    end
  end
end
