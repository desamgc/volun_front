class Rt::ProjectUnsubscribesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json
  
  def index
  end

  def show
  end

  def new
    @rt_project_unsubscribe = ProjectUnsubscribe.new
    @rt_project_unsubscribe.project = Project.find_by_id(params[:project_id])
    
  end

  def edit
  end

  def create
    @rt_project_unsubscribe = ProjectUnsubscribe.new(rt_project_unsubscribe_params)
    @rt_project_unsubscribe.request_form.user_id = current_user.id
    if @rt_project_unsubscribe.save
      redirect_to index_i_projects_path, notice: t('rt_project_unsubscribe.response')
    else
      respond_with(@rt_project_unsubscribe)
    end
  end

  def update
   end

  def destroy
  end

  protected

    def rt_project_unsubscribe_params
      params.require(:rt_project_unsubscribe).permit(:project_id, :reason)
    end
end
