# class of volunteer subscribe
class Rt::VolunteerSubscribesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  invisible_captcha only: [:create], honeypot: :subtitle
  before_action :set_rt_volunteer_subscribe, only: [:show, :edit, :update, :destroy]
  # en el modelo se controla que no exista una solicitud con ese email
  # pero puede haberse dado de alta al usuario sin haber solicitud
  before_action :user_exists, only: :create
  before_action :set_fields, only: :new
  respond_to :html, :js, :json

  def new

  end

  def index
    session.delete(:project)
    redirect_to projects_path
  end

  def create
    @rt_volunteer_subscribe = Rt::VolunteerSubscribe.new(rt_volunteer_subscribe_params)
    @rt_volunteer_subscribe.request_form.user_id = current_user.id if current_user
    if @rt_volunteer_subscribe.save
      session.delete(:project)
      redirect_to projects_path, notice: t('volunteer_subscribe.response')
    else
      respond_with(@rt_volunteer_subscribe)
    end
  end

  protected

  def user_exists
    return unless rt_volunteer_subscribe_params[:project_id] == ""
    return unless User.where(email: rt_volunteer_subscribe_params[:email]).exists?
    redirect_to new_user_session_path, alert: I18n.t('user.exist')
  end

  def set_fields
    session[:project] ||= params[:project_id]
    if current_user && current_user.loggable_type == Volunteer.name
      @rt_volunteer_subscribe = Rt::VolunteerSubscribe.new(project_id: session[:project],
                                                           name: current_user.loggable.name,
                                                           last_name: current_user.loggable.last_name,
                                                           phone_number: current_user.loggable.phone_number,
                                                           email: current_user.loggable.email)
      @rt_volunteer_subscribe.request_form.user_id = current_user.id
    else
      @rt_volunteer_subscribe = Rt::VolunteerSubscribe.new
    end
  end

  def set_rt_volunteer_subscribe
    @rt_volunteer_subscribe = Rt::VolunteerSubscribe.find(params[:id])
  end

  def rt_volunteer_subscribe_params
    params.require(:rt_volunteer_subscribe).permit(:name, :last_name, :last_name_alt, :phone_number, :phone_number_alt, :email, :project_id, request_form: [:user_id])
  end
end
