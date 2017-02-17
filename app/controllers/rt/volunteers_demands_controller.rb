# class for request volunteers demand
class Rt::VolunteersDemandsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_volunteers_demand = Rt::VolunteersDemand.new
  end

  def edit
  end

  def create
    @rt_volunteers_demand = Rt::VolunteersDemand.new(rt_volunteers_demand_params)
    @rt_volunteers_demand.request_form.user_id = current_user.id
    if @rt_volunteers_demand.save
      redirect_to index_i_projects_path, notice: t('rt_volunteers_demand.response')
    else
      respond_with(@rt_volunteers_demand)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def rt_volunteers_demand_params
    params.require(:rt_volunteers_demand).permit(:description, :execution_start_date, :execution_end_date, :road_type_id, :road_name, :number_type, :road_number, :postal_code, :town, :province_id, :requested_volunteers_num, :volunteers_profile, :volunteer_functions_1, :volunteer_functions_2, :volunteer_functions_3)
  end
end