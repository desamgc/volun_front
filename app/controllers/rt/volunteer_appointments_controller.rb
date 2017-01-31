# request volunteer appoinment
class Rt::VolunteerAppointmentsController < ApplicationController
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_volunteer_appointment = VolunteerAppointment.new
  end

  def edit
  end

  def create
    @rt_volunteer_appointment = VolunteerAppointment.new(rt_volunteer_appointment_params)
    @rt_volunteer_appointment.request_form.user_id = current_user.id
    if @rt_volunteer_appointment.save
      redirect_to index_i_projects_path, notice: t('rt_volunteer_appointment.response')
    else
      respond_with(@rt_volunteer_appointment)
    end
  end

  def update
    @rt_volunteer_appointment.update_attributes(rt_volunteer_appointment_params)
    respond_with(@rt_volunteer_appointment)
  end

  def destroy
  end

  protected

  def rt_volunteer_appointment_params
    params.require(:rt_volunteer_appointment).permit(:volunteer_id, :reason)
  end
end
