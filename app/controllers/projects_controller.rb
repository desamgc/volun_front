# controller de projects
class ProjectsController < ApplicationController
  before_filter :authenticate_user!, only: :my_area
  before_action :set_project, only: :show
  before_action :set_areas, only: :index
  before_action :set_boroughs, only: :index
  before_action :set_districts, only: :index
  respond_to :html, :js, :json

  def my_area
    params[:q] ||= Project.ransack_default
    @search = Project.includes(:areas).search(params[:q])
    @projects_actives = @search.result.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    params[:q] ||= Project.ransack_default
    session[:params] = ''
    @search = Project.includes(:areas).no_urgent.search(params[:q])
    @projects_actives = @search.result.page(params[:page])
    @locations = Event.includes(:address).where(eventable_type: Project.name).as_json(only: [:id], include: { address: { only: [:latitude, :longitude] } })
    respond_to do |format|
      format.html
      format.js { render action: 'search.js.erb' }
    end
  end

  def search
    params[:q] ||= session[:params]
    session[:params] = params[:q]
    @projects_actives = Project.includes(:areas).no_urgent.search(params[:q]).result.order(params[:order]).page(params[:page])
    @locations = @projects_actives.map(&:events).as_json(only: [:id], include: { address: { only: [:latitude, :longitude] } }).flatten
    respond_to do |format|
      format.html
      format.js
    end
  end

  def boroughs
    @boroughs = Project.includes(:addresses).no_urgent.distinct.where('addresses.district=?', params[:district]).order('addresses.borough').pluck('addresses.borough', 'addresses.borough')
    respond_to do |format|
      format.json { render json: @boroughs }
    end
  end

  def show
    params[:day] ||= @project.timetables.minimum(:execution_date).try :strftime, '%Y-%m-%d'
    @timetables = @project.timetables.where(timetables: { execution_date: params[:day] })
    @locations = Event.includes(:project, :address).where(projects: { id: params[:id] }).as_json(only: [:id], include: { address: { only: [:latitude, :longitude] } })
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def set_boroughs
      @boroughs = '' if params[:page].blank?
    end

    def set_areas
      @areas = Area.all.order(:name) if params[:page].blank?
    end

    def set_districts
      @districts = Project.includes(:addresses).no_urgent.distinct.order("district").pluck('district', 'district') if params[:page].blank?
    end

    def set_project
      @project = Project.includes(:addresses).find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :active, :description, :functions, :execution_start_date, :execution_end_date, :contact_name, :contact_first_surname, :contact_second_surname, :phone_number, :email, :comments, :beneficiaries_num, :volunteers_num, :insured, :insurance_date, :project_type_id, :entity_id, :addresses_attributes [:id, :road_name], :timetables)
    end
end
