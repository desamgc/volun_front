# request volunteer appoinment
class RtVolunteerAppointmentsController < ApplicationController
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_volunteer_appointment = RtVolunteerAppointment.new
  end

  def edit
  end

  def create
    @rt_volunteer_appointment = RtVolunteerAppointment.new(rt_volunteer_appointment_params)
    @rt_volunteer_appointment.build_request_form
    @rt_volunteer_appointment.volunteer = Volunteer.find_by_id(current_user.profileable_id)
    if @rt_volunteer_appointment.save
      redirect_to projects_url, notice: t('rt_volunteer_appointment.response')
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
