# class for publishing project
class Rt::ProjectPublishingsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json
  before_action :set_project, only: [:new]
  def new
    @rt_project_publishing = Rt::ProjectPublishing.new
    load_rt_project_publishing if @project
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

  protected

  def load_rt_project_publishing
    @rt_project_publishing.notes = @project.name
    @rt_project_publishing.description = @project.description
  end

  def set_project
    @project = Project.unscoped.find_by_id params[:project_id] if params[:project_id]
  end

  def rt_project_publishing_params
    params.require(:rt_project_publishing).permit(:notes, :description, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :entity_id, :project_id)
  end
end
