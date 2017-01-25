class ActivitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Activity.ransack_default
    @search_q = @activities.search(params[:q])
    @activities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@activities)
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
