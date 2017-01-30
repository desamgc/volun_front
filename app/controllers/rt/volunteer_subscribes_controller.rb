# class of volunteer subscribe
class Rt::VolunteerSubscribesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  before_action :set_rt_volunteer_subscribe, only: [:show, :edit, :update, :destroy]
  before_action :unique_email, only: [:create]
  respond_to :html, :js, :json

  def index
  end

  def new
    @rt_volunteer_subscribe = VolunteerSubscribe.new
  end

  def edit
  end

  def create
    @rt_volunteer_subscribe = VolunteerSubscribe.new(rt_volunteer_subscribe_params)
    if @rt_volunteer_subscribe.save
      redirect_to index_i_projects_path, notice: t('volunteer_subscribe.response')
    else
      respond_with(@rt_volunteer_subscribe)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def unique_email
    if User.where(email: rt_volunteer_subscribe_params[:email]).exists? 
      #@rt_volunteer_subscribe = RtVolunteerSubscribe.new(rt_volunteer_subscribe_params)
      #flash.now[:alert] = "Ya existe un usuario con ese email. Desea recordar constraseña?"
      #flash.now[:alert] =|| link_to "Olvide mi contraseña", new_password_path("user") 
      #render action: 'new'
      redirect_to new_password_path("user"), alert:"Ya existe un usuario con ese email. Desea recordar constraseña?"  
    end
  end 

  def set_rt_volunteer_subscribe
    @rt_volunteer_subscribe = VolunteerSubscribe.find(params[:id])
  end

  def rt_volunteer_subscribe_params
    params.require(:rt_volunteer_subscribe).permit(:name, :first_surname, :second_surname, :phone_number, :phone_number_alt, :email)
  end
end
