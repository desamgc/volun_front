class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, only: [:my_area]
  before_action :set_activity, only: [:show]
  respond_to :html, :js, :json


  def my_area
    params[:q] ||= Ransack.default
    @search_q = Activity.search(params[:q])
    @activities = @search_q.result.page(params[:page]).per(12)
    respond_to do |format|
      format.html
      format.js
    end
  end


  def index
     params[:day] ||= Activity.includes(:timetables).activities_present(Time.now).minimum(:execution_date).try :strftime, "%Y-%m-%d"
     # version con eventos
     @search_q = Event.includes(:address, :timetables, :activity, project: [:links]).where(eventable_type: Activity.name).search({timetables_execution_date_eq: params[:day] })
     @events = @search_q.result.uniq.page(params[:page]).per(6)

     # version con timetables
     #@search_q = Timetable.joins(:activity, event: [:activity]).distinct(:execution_date).where("events.eventable_type='Activity'").order(:execution_date).search({execution_date_eq: params[:day] })
     #@events = @search_q.result.page(params[:page]).per(6)

     @list_days = Activity.includes(:timetables).distinct.activities_present(Time.now).order('timetables.execution_date').pluck('timetables.execution_date').to_json
     @boroughs = ""
     @areas = Area.all
     @day = params[:day].to_json
     @districts = Activity.includes(:addresses).actives.distinct.order("district").pluck('district','district')
     respond_to do |format|
       format.html
       format.js {render :action => 'search.js.erb'}
     end
  end

  def search
    if params[:day]
      @day = params[:day]
      @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search({timetables_execution_date_eq: params[:day] })
      #@search_q = Timetable.joins(:activity, event: [:activity]).where("events.eventable_type='Activity'").order(:execution_date).search({execution_date_eq: @day })

    else
      @day = nil
      @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search(params[:q])
      #@search_q = Timetable.joins(:activity, event: [:activity]).where("events.eventable_type='Activity'").order(:execution_date).search(params[:q])
    end
    @events = @search_q.result.uniq.page(params[:page]).per(6)
    #@events = @search_q.result.uniq.page(params[:page]).per(6)
    respond_to do |format|
      format.js
    end
  end


  def boroughs
   @boroughs = Activity.includes(:addresses).actives.distinct.where("addresses.district=?", params[:district]).order("addresses.borough").pluck('addresses.borough', 'addresses.borough')
    respond_to do |format|
      format.json { render json: @boroughs }
    end

  end if

  def show
    params[:day] ||= @activity.timetables.minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @timetables = @activity.timetables.where(timetables: {execution_date: params[:day]})
    @locations_activity = @activity.timetables.includes(:address).where(timetables: {execution_date: params[:day]}).as_json(only: [:id, :description], include: [:address, {address: {only:[:latitude, :longitude]}}])

    @list_days_activity = @activity.timetables.pluck('timetables.execution_date').to_json
    @date = params[:day]
    @day = params[:day].to_json
    respond_to do |format|
       format.html
       format.js
     end
  end



  protected
    def set_activity
      @activity = Activity.find(params[:id])
    end
    def activity_params
      params.require(:activity).permit(:name, :description, :active)
    end
end
