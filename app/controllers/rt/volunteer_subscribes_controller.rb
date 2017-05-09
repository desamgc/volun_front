# class of volunteer subscribe
class Rt::VolunteerSubscribesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  before_action :set_rt_volunteer_subscribe, only: [:show, :edit, :update, :destroy]
  before_action :user_exists, only: [:create]
  before_action :set_fields, only: [:new]
  respond_to :html, :js, :json

  def new
    if current_user && current_user.loggable_type == "Volunteer"
          if @rt_volunteer_subscribe.save
            redirect_to project_path(session[:project]), notice: t('volunteer_subscribe.response')
          else
            redirect_to project_path(session[:project]), notice: t('volunteer_subscribe.responseKO')
          end
    end

  end

  def create
    @rt_volunteer_subscribe = Rt::VolunteerSubscribe.new(rt_volunteer_subscribe_params)
    if @rt_volunteer_subscribe.save
      redirect_to projects_path(current_user), notice: t('volunteer_subscribe.response')
    else
      respond_with(@rt_volunteer_subscribe)
    end
  end


  protected

  def user_exists
    if User.where(email: rt_volunteer_subscribe_params[:email]).exists?
      redirect_to new_password_path("user"), alert:"Ya existe un usuario con ese email. Desea recordar constraseña?"
    end
  end

  def set_fields
    session[:project] ||= params[:project_id]
    if current_user && current_user.loggable_type == "Volunteer"

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
    params.require(:rt_volunteer_subscribe).permit(:name, :last_name, :last_name_alt, :phone_number, :phone_number_alt, :email, :project_id,request_form: [:user_id])
  end
end
