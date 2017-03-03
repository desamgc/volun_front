class WelcomeController < ApplicationController
  respond_to :html, :js, :json
  def index
  	@search = Project.includes(:links).actives.all
  	@projects_featured = Project.includes(:links).featured
  	@projects_outstanding = Project.includes(:links).outstanding
  	@locations = Project.includes(:links).actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )



  	params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @search_q = Activity.includes(:events, :timetables).search({timetables_execution_date_eq: params[:day] })
    @activities = @search_q.result #.paginate(page: params[:page], per_page: params[:per_page]||15)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date')
    @list_days = @list_days.to_json
    @day = params[:day]
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
