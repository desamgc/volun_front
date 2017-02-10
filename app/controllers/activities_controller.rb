class ActivitiesController < ApplicationController

  respond_to :html, :js, :json

  def index

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
    respond_with(@activity) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity.save
    respond_with(@activity)
  end

  def update
    @activity.update_attributes(activity_params)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  protected

    def activity_params
      params.require(:activity).permit(:name, :description, :active)
    end
end
