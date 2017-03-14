class WelcomeController < ApplicationController
  respond_to :html, :js, :json
  def index
  	@search = Project.actives.all
  	@projects_featured = Project.featured
  	@project_urgent = Project.urgent.limit(1)
  	@locations = Project.includes(:addresses).actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )



  	params[:day] ||= Activity.includes(:timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @search_q = Activity.includes(:timetables).distinct(:name).order(:timetables_execution_date).search({timetables_execution_date_gteq: params[:day] })
    @search_q.sorts = 'timetables.execution_date'
    @activities = @search_q.result.limit(2)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date')
    @list_days = @list_days.to_json
    @day = params[:day]
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
