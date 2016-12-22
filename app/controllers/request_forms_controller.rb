class RequestFormsController < ApplicationController
  before_action :set_request_form, only: [:show, :edit, :update, :destroy]
  before_action :set_rt_extension, only: [:show, :new, :edit, :create, :update]
  respond_to :html, :js, :json

  def index
    params[:q] ||= RequestForm.ransack_default
    @search_q = @request_forms.search(params[:q])
    @request_forms = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@request_forms)
  end

  def show
    respond_with(@request_form) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @request_form = RequestForm.new
    respond_with(@request_form)
  end

  def edit
  end

  def create
    @request_form.save
    respond_with(@request_form)
  end

  def update
    @request_form.update_attributes(request_form_params)
    respond_with(@request_form)
  end

  def destroy
    @request_form.destroy
    respond_with(@request_form)
  end

  protected

    def set_request_form
      @request_form = RequestForm.find(params[:id])
    end

    def set_rt_extension
      @request_form = RequestForm.new
      @rt_extension = params[:rt_extension]
      @request_form.request_type = RequestType.where(kind: RequestType.kinds[@rt_extension]).take
      @request_form.build_rt_extendable @rt_extension
      @rt_volunteer_subscribe = @request_form.rt_extendable
    end

    def request_form_params
      params.require(:request_form).permit(:request_type_id, :sent_at, :status, :status_date, :rejection_type_id, :comments,rt_extendable_attributes: [:id, :name, :first_surname, :second_surname, :phone_number, :phone_number_alt, :email] )
    end
end
