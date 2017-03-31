# controller for request amendments of volunteer
class Rt::VolunteerAmendmentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
    respond_with(@rt_volunteer_amendment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_volunteer_amendment = Rt::VolunteerAmendment.new
    set_amendment_volunteer
  end

  def edit
  end

  def create
    @rt_volunteer_amendment = Rt::VolunteerAmendment.new(rt_volunteer_amendment_params)
    @rt_volunteer_amendment.request_form.user_id = current_user.id
    if @rt_volunteer_amendment.save
      redirect_to user_path(current_user), notice: t('volunteer_amendment.response')
    else
      respond_with(@rt_volunteer_amendment)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def rt_volunteer_amendment_params
    params.require(:rt_volunteer_amendment).permit(:volunteer_id, :address_id, :phone_number, :phone_number_alt, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province,:email)
  end

  def set_amendment_volunteer
    @rt_volunteer_amendment.phone_number = Volunteer.find_by_id(current_user.loggable_id).phone_number
    @rt_volunteer_amendment.phone_number_alt = Volunteer.find_by_id(current_user.loggable_id).phone_number_alt
    @rt_volunteer_amendment.email = current_user.email
    @rt_volunteer_amendment.road_type = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.road_type
    @rt_volunteer_amendment.road_name = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.road_name
    @rt_volunteer_amendment.number_type = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.road_number_type
    @rt_volunteer_amendment.road_number = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.road_number
    @rt_volunteer_amendment.postal_code = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.postal_code
    @rt_volunteer_amendment.town = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.town
    @rt_volunteer_amendment.province = Volunteer.includes(:address).find_by_id(current_user.loggable_id).address.province
  end
end
