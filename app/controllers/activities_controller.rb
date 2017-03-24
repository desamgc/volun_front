class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  before_action :set_activity, only: [:show]
  respond_to :html, :js, :json


  def index
    params[:q] ||= Ransack.default
    @search_q = Activity.search(params[:q])
    @activities = @search_q.result.page(params[:page]).per(12)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index_i
     params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
     @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search({timetables_execution_date_eq: params[:day] })
     @events = @search_q.result.uniq.page(params[:page]).per(12)
     @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json
     @boroughs = ""
     @areas = Area.all
     @day = params[:day].to_json
     @districts = Activity.includes(:addresses).actives.distinct.order("district").pluck('district','district')
     respond_to do |format|
       format.html
       format.js
     end
  end

  def search
    if params[:day]
      @day = params[:day]
      @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search({timetables_execution_date_eq: params[:day] })
    else
      @day = nil
      @search_q = Event.includes(:address, :timetables, activity: [:area]).where(eventable_type: Activity.name).search(params[:q])
    end
    @events = @search_q.result.uniq.page(params[:page]).per(12)
    respond_to do |format|
      format.js
    end
  end

  def index_i_ant
    params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @search_q = Timetable.includes(:event).activities.search({execution_date_eq: params[:day] })
    @timetables = @search_q.result.page(params[:page]).per(12)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date').to_json
    @boroughs = ""
    @areas = Area.all
    @day = params[:day].to_json
    @districts = Activity.includes(:addresses).actives.distinct.order("district").pluck('district','district')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search_old
    if params[:day]
      @day = params[:day]
      @search_q = Timetable.search({execution_date_eq: params[:day] })
    else
      @day = nil
      @search_q = Timetable.search(params[:q])
    end

    @timetables = @search_q.result.page(params[:page]).per(12)
    respond_to do |format|
      format.html
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
    @locations_activity = @activity.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
  end



  protected
    def set_activity
      @activity = Activity.includes(:links).find(params[:id])
    end
    def activity_params
      params.require(:activity).permit(:name, :description, :active)
    end
end
