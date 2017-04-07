class WelcomeController < ApplicationController
  respond_to :html, :js, :json
  def index
  	@projects_featured = Project.includes(:areas).featured
  	@project_urgent = Project.urgent.limit(1)
  	@locations = Project.includes(:addresses).actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )

    #version compleja de mostrar eventos
  	#params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    #@search_q = Event.includes(:address, :activity).where(eventable_type: Activity.name).search({timetables_execution_date_gteq: params[:day] })
    #@events = @search_q.result.uniq
    #@list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json
    #@day = params[:day].to_json

    #version con actividades
    #params[:day] ||= Time.now #Activity.includes(:timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    #@search_q = Activity.search({timetables_execution_date_gteq: params[:day] })
    #@activities = @search_q.result.limit(2)
    #@list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json
    #@day = params[:day]

    #version con timetables
    params[:day] ||= Time.now #Activity.includes(:timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @search_q = Timetable.joins(:activity, event: [:activity]).distinct(:execution_date).where("events.eventable_type='Activity'").order(:execution_date).search({execution_date_gteq: params[:day] })
    @events = @search_q.result.limit(2)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json

    respond_to do |format|
      format.html
      format.js
    end
  end
end
