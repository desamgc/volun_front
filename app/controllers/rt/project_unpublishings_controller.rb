class Rt::ProjectUnpublishingsController < ApplicationController

  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectUnpublishing.ransack_default
    @search_q = @rt_project_unpublishings.search(params[:q])
    @rt_project_unpublishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_unpublishings)
  end

  def show
    respond_with(@rt_project_unpublishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_project_unpublishing = ProjectUnpublishing.new
  end

  def edit
  end

  def create
    @rt_project_unpublishing = ProjectUnpublishing.new(rt_project_unpublishing_params)
    if @rt_project_unpublishing.save
      redirect_to projects_url, notice: t('rt_project_unpublishing.response')
    else
      respond_with(@rt_project_unpublishing)
    end
  end

  def update
    @rt_project_unpublishing.update_attributes(rt_project_unpublishing_params)
    respond_with(@rt_project_unpublishing)
  end

  def destroy
    @rt_project_unpublishing.destroy
    respond_with(@rt_project_unpublishing)
  end

  protected

    def rt_project_unpublishing_params
      params.require(:rt_project_unpublishing).permit(:reason)
    end
end
