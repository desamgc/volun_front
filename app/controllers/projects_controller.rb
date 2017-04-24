# controller de projects
class ProjectsController < ApplicationController
  before_filter :authenticate_user!, only: [:my_area]
  before_action :set_project, only: [:show]
  respond_to :html, :js, :json


  def my_area
    params[:q] ||= Project.ransack_default
    @search = Project.includes(:areas, :addresses, :entity).search(params[:q])
    @projects_actives = @search.result.page(params[:page]).per(6)
    respond_to do |format|
      format.html
      format.js
    end
  end


  def index
    params[:q] ||= Project.ransack_default
    @search = Project.includes(:areas, :addresses).actives.search(params[:q])
    @projects_actives = @search.result.page(params[:page]).per(6)
    @locations = Project.includes(:addresses).as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
    if (params[:page].blank?)
      #@projects_featured = Project.includes(:areas).featured
      @districts = Project.includes(:addresses).actives.distinct.order("district").pluck('district','district')
      @boroughs = ""
      @areas = Area.all
    end
    respond_to do |format|
      format.html
      format.js {render :action => 'search.js.erb'}
    end
  end

  def search
    params[:q] ||= Project.ransack_default
    @search = Project.includes(:areas, :addresses, :entity).actives.search(params[:q])
    @projects_actives = @search.result.page(params[:page]).per(6)
    @locations = @projects_actives.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
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

    params[:day] ||= @project.timetables.minimum(:execution_date).try :strftime, "%Y-%m-%d"
    @timetables = @project.timetables.where(timetables: {execution_date: params[:day]})
    @locations = @project.as_json(only: [:id, :description], include: [:addresses, {addresses: {only:[:latitude, :longitude]}}] )
     #@list_days_project = @project.timetables.pluck('timetables.execution_date').to_json
    #@date = params[:day]
    #@day = params[:day].to_json
    respond_to do |format|
       format.html
       format.js
     end

  end

  private

  def set_project
    @project = Project.includes(:addresses).find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :active, :description, :functions, :execution_start_date, :execution_end_date, :contact_name, :contact_first_surname, :contact_second_surname, :phone_number, :email, :comments, :beneficiaries_num, :volunteers_num, :insured, :insurance_date, :project_type_id, :entity_id, :addresses_attributes [:id, :road_name], :timetables)
  end
end
