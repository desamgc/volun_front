class RtEntitySubscribesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  before_action :set_rt_entity_subscribe, only: [:show, :edit, :update, :destroy]
  before_action :unique_email, only: [:create]
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_entity_subscribe = RtEntitySubscribe.new
  end

  def edit
  end

  def create
    @rt_entity_subscribe = RtEntitySubscribe.new(rt_entity_subscribe_params)
    if @rt_entity_subscribe.save
      redirect_to index_i_projects_path, notice: t('volunteer_subscribe.response')
    else
      respond_with(@rt_entity_subscribe)
    end
  end

  def update
  end

  def destroy
  end

  protected
    def unique_email
      if User.where(email: rt_entity_subscribe_params[:email]).exits > 0 
        redirect_to new_password_path("user"), alert:"Ya existe un usuario con ese email. Desea recordar constraseña?"  
      end
    end 
    def rt_entity_subscribe_params
      params.require(:rt_entity_subscribe).permit(:name, :vat_num, :email, :contact_name, :contact_first_surname, :contact_second_surname, :representative_name, :representative_first_surname, :representative_second_surname, :phone_number, :phone_number_alt, :road_type_id, :road_name, :number_type, :road_number, :postal_code, :town, :province_id, :request_reason_id, :entity_type_id, :other_motive)
    end
end
