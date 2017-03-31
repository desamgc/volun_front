class Rt::ActivityPublishingsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_activity_publishing = Rt::ActivityPublishing.new
  end

  def edit
  end

  def create
    @rt_activity_publishing = Rt::ActivityPublishing.new(rt_activity_publishing_params)
    @rt_activity_publishing.request_form.user_id = current_user.id
    if @rt_activity_publishing.save
      redirect_to user_path(current_user), notice: t('activity_publishing.response')
    else
      respond_with(@rt_activity_publishing)
    end
  end

  def update
  end

  def destroy
  end

  protected

    def rt_activity_publishing_params
      params.require(:rt_activity_publishing).permit(:name, :organizer, :description, :execution_date, :execution_hour, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :entity_id, :project_id)
    end
end
