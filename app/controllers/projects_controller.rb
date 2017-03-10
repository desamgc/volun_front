# controller de projects
class ProjectsController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  before_action :set_project, only: [:show]
  respond_to :html, :js, :json

  
  def index
    #@search = Project.includes(:project_type).search(params[:q])
    #@projects = @search.result   #.paginate(page: params[:page], per_page: params[:per_page] || 5)
    
    @projects = Project.includes(:project_type).all.page(params[:page]).per(5)
    
    respond_to do |format|
      format.html
      format.js
    end
  end


  def index_i
    params[:q] ||= Project.ransack_default
    @search = Project.includes(:areas, :addresses).actives.search(params[:q])
    @projects_actives = @search.result.page(params[:page]).per(6)  
    @projects_featured = Project.includes(:areas).featured
    @locations = @projects_actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
    @districts = Project.includes(:addresses).actives.distinct.order("district").pluck('district','district')
    @boroughs = ""
    @areas = Area.all
    @grid = true
    respond_to do |format|
      format.html
      format.js
    end
  end

  def boroughs
   @boroughs = Project.includes(:addresses).actives.distinct.where("addresses.district=?", params[:district]).order("addresses.borough").pluck('addresses.borough', 'addresses.borough')
    respond_to do |format|
      format.json { render json: @boroughs }
    end  

  end if  

  
  # GET /projects/1
  # GET /projects/1.json
  def show
    @locations_project = @project.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
    
  end

  private

  def set_project
    @project = Project.includes(:links).find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :active, :description, :functions, :execution_start_date, :execution_end_date, :contact_name, :contact_first_surname, :contact_second_surname, :phone_number, :email, :comments, :beneficiaries_num, :volunteers_num, :insured, :insurance_date, :project_type_id, :entity_id, :addresses_attributes [:id, :road_name], :timetables)
  end
end
