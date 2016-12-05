# controller de projects
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  respond_to :html, :js, :json

  def index
    #params[:q] ||= Project.ransack_default
    @search = Project.includes(:districts, :addresses, :timetables, :project_type).search(params[:q])
    @projects_actives = @search.result  #paginate(page: params[:page], per_page: params[:per_page] || 15)

    @projects_featured = Project.featured
    gon.items = @projects_actives
    @grid = true
    debugger
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :active, :description, :functions, :execution_start_date, :execution_end_date, :contact_name, :contact_first_surname, :contact_second_surname, :phone_number, :email, :comments, :beneficiaries_num, :volunteers_num, :insured, :insurance_date, :project_type_id, :entity_id)
  end
end
