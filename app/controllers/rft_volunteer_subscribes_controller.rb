class RftVolunteerSubscribesController < ApplicationController
  before_action :set_rft_volunteer_subscribe, only: [:show, :edit]
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftVolunteerSubscribe.ransack_default
    @search_q = @rft_volunteer_subscribes.search(params[:q])
    @rft_volunteer_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_volunteer_subscribes)
  end

  def show
    respond_with(@rft_volunteer_subscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_volunteer_subscribe = RftVolunteerSubscribe.new
    respond_with(@rft_volunteer_subscribe)
  end

  def edit
  end

  def create
    #@rft_volunteer_subscribe.save
    #respond_with(@rft_volunteer_subscribe)
    @rft_volunteer_subscribe = RftVolunteerSubscribe.new(rft_volunteer_subscribe_params)
    if @rft_volunteer_subscribe.save
      redirect_to projects_url, notice: t('nuevoOk')
    else
      render action: 'new'
    end
  end

  def update
    @rft_volunteer_subscribe.update_attributes(rft_volunteer_subscribe_params)
    respond_with(@rft_volunteer_subscribe)
  end

  def destroy
    @rft_volunteer_subscribe.destroy
    respond_with(@rft_volunteer_subscribe)
  end

  protected
    def set_rft_volunteer_subscribe
      @rft_volunteer_subscribe = RftVolunteerSubscribe.find(params[:id])
    end

    def rft_volunteer_subscribe_params
      params.require(:rft_volunteer_subscribe).permit(:request_form_type_id, :request_form_id, :name, :first_surname, :second_surname, :phone_number, :phone_number_alt, :email )
    end
end
