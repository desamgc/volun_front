# request volunteer appoinment
class Rt::VolunteerAppointmentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def new
    @rt_volunteer_appointment = Rt::VolunteerAppointment.new
  end

  def create
    @rt_volunteer_appointment = Rt::VolunteerAppointment.new(rt_volunteer_appointment_params)
    @rt_volunteer_appointment.request_form.user_id = current_user.id
    if @rt_volunteer_appointment.save
      redirect_to user_path(current_user), notice: t('volunteer_appointment.response')
    else
      respond_with(@rt_volunteer_appointment)
    end
  end

  protected

    def rt_volunteer_appointment_params
      params.require(:rt_volunteer_appointment).permit(:volunteer_id, :notes)
    end
end
