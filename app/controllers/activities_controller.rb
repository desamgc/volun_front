class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, only: :my_area
  before_action :load_query_search, only: :search
  before_action :set_activity, only: :show
  before_action :set_list_days_show, only: :show
  before_action :set_locations, only: :show
  before_action :set_areas, only: :index
  before_action :set_districts, only: :index
  before_action :set_boroughs, only: :index
  before_action :set_list_days, only: :index
  before_action :load_query, only: :index
  respond_to :html, :js, :json
  # after_filter :allow_iframe, only: [:show]

  def my_area
    params[:q] ||= Ransack.default
    @search_q = Activity.search(params[:q])
    @activities = @search_q.result.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @num_records = @search_q.result.length
    @timetables = @search_q.result.page(params[:page]).per(Kaminari.config.default_per_page_activity)
    respond_to do |format|
      format.html
      format.js { render action: 'search.js.erb' }
    end
  end

  def search
    @num_records = @search_q.result.length
    @timetables = @search_q.result.page(params[:page]).per(Kaminari.config.default_per_page_activity)
    respond_to do |format|
      format.js
    end
  end

  def boroughs
    @boroughs = Activity.includes(:addresses).distinct.where('addresses.district=?', params[:district]).order('addresses.borough').pluck('addresses.borough', 'addresses.borough')
    respond_to do |format|
      format.json { render json: @boroughs }
    end
  end

  def show
    @timetables = @activity.timetables.where(timetables: { execution_date: params[:day] })
    @day = params[:day].to_json
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected

  def load_query
    if params[:day]
      @search_q = Timetable.select('execution_date,activities.id, activities.name').joins(:activity).group('execution_date, activities.id').search(execution_date_eq: params[:day])
      @day = params[:day]
    else
      @search_q = Timetable.select('execution_date, activities.id').joins(:activity).order(:execution_date).group('execution_date, activities.id').search(execution_date_gteq: Time.now)
      @day = nil
    end
  end

  def load_query_search
    if params[:day]
      @day = params[:day]
      @search_q = Timetable.select('execution_date, activities.id').joins(:activity).order(:execution_date).group('execution_date, activities.id').search(execution_date_eq: @day)
    else
      @day = nil
      @search_q = Timetable.select('execution_date, activities.id').joins(:activity).order(:execution_date).group('execution_date, activities.id').search(params[:q])
    end
  end

  def set_list_days_show
    @list_days_activity = @activity.timetables.pluck('timetables.execution_date').to_json
  end

  def set_list_days
    @list_days = Activity.includes(:timetables).distinct.activities_present(Time.now).order('timetables.execution_date').pluck('timetables.execution_date').to_json
  end

  def set_locations
    params[:day] ||= @activity.timetables.minimum(:execution_date).try :strftime, '%Y-%m-%d'
    @locations = Event.includes(:address, :activity, :timetables).where(activities: { id: params[:id] }, timetables: { execution_date: params[:day] }).as_json(only: [:id], include: { address: { only: [:latitude, :longitude] } })
  end

  def set_boroughs
    @boroughs = ''
  end

  def set_areas
    @areas = Area.all.order(:name)
  end

  def set_districts
    @districts = Activity.includes(:addresses).distinct.order('district').pluck('district', 'district')
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :active)
  end

  def allow_iframe
    response.headers.delete 'X-Frame-Options'
  end
end
