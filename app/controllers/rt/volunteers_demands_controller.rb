# class for request volunteers demand
class Rt::VolunteersDemandsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json
  before_action :set_project, only: [:new]
  def new
    @rt_volunteers_demand = Rt::VolunteersDemand.new
    load_rt_project_publishing if @project
  end

  def create
    @rt_volunteers_demand = Rt::VolunteersDemand.new(rt_volunteers_demand_params)
    @rt_volunteers_demand.request_form.user_id = current_user.id
    if @rt_volunteers_demand.save
      redirect_to user_path(current_user), notice: t('volunteers_demand.response')
    else
      respond_with(@rt_volunteers_demand)
    end
  end

  protected

  def load_rt_project_publishing
    @rt_volunteers_demand.notes = @project.name
    @rt_volunteers_demand.description = @project.description
  end

  def set_project
   @project = Project.unscoped.find_by_id (params[:project_id]) if params[:project_id]
  end

  def rt_volunteers_demand_params
    params.require(:rt_volunteers_demand).permit(:notes,:description, :execution_start_date, :execution_end_date, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :requested_volunteers_num, :volunteers_profile, :volunteer_functions_1, :volunteer_functions_2, :volunteer_functions_3)
  end
end
