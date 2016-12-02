class RequestFormsController < ApplicationController

  load_and_authorize_resource
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

    def request_form_params
      params.require(:request_form).permit(:request_form_type_id, :sent_at, :status, :status_date, :rejection_type_id, :comments)
    end
end
