class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  before_action :set_activity, only: [:show]
  respond_to :html, :js, :json
  

  def index
    @activities = Activity.all.page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end


  def index_i

    params[:q] ||= Activity.ransack_default
    params[:day] ||= Activity.includes(:events, :timetables).activities_present(0.day.ago.to_s).minimum(:execution_date).strftime ("%Y-%m-%d")
    @search_q = Activity.includes(:events, :timetables).search({timetables_execution_date_eq: params[:day] })
    @activities = @search_q.result #.paginate(page: params[:page], per_page: params[:per_page]||15)
    @list_days = Activity.includes(:timetables).distinct.activities_present(0.day.ago.to_s).order('timetables.execution_date').pluck('timetables.execution_date')
    @list_days = @list_days.to_json
     #@first_day = @list_days.minimum(:execution_date).strftime ("%d/%m/%Y")
    @day = params[:day]
    respond_to do |format|
      format.html
      format.js
      #format.json @day
    end
  end

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
