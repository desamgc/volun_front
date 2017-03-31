# class for publishing project
class Rt::ProjectPublishingsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_project_publishing = Rt::ProjectPublishing.new
  end

  def edit
  end

  def create
    @rt_project_publishing = Rt::ProjectPublishing.new(rt_project_publishing_params)
    @rt_project_publishing.request_form.user_id = current_user.id
    if @rt_project_publishing.save
      redirect_to user_path(current_user), notice: t('project_publishing.response')
    else
      respond_with(@rt_project_publishing)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def rt_project_publishing_params
    params.require(:rt_project_publishing).permit(:description, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :entity_id, :project_id)
  end
end
