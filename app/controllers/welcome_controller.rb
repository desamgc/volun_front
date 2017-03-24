class WelcomeController < ApplicationController
  respond_to :html, :js, :json
  def index
  	@projects_featured = Project.includes(:areas).featured
  	@project_urgent = Project.urgent.limit(1)
  	@locations = Project.includes(:addresses).actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )

  	params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search({timetables_execution_date_eq: params[:day] })
    @events = @search_q.result.uniq.limit(2)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json
    @day = params[:day]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
