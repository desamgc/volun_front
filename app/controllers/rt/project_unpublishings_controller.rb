class Rt::ProjectUnpublishingsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def new
    @rt_project_unpublishing = Rt::ProjectUnpublishing.new
    @rt_project_unpublishing.project_id = params[:project_id]
  end

  def create
    @rt_project_unpublishing = Rt::ProjectUnpublishing.new(rt_project_unpublishing_params)
    @rt_project_unpublishing.request_form.user_id = current_user.id
    if @rt_project_unpublishing.save
      redirect_to user_path(current_user), notice: t('project_unpublishing.response')
    else
      respond_with(@rt_project_unpublishing)
    end
  end

  protected

    def rt_project_unpublishing_params
      params.require(:rt_project_unpublishing).permit(:notes, :project_id)
    end
end
