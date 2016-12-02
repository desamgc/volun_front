class RequestFormTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RequestFormType.ransack_default
    @search_q = @request_form_types.search(params[:q])
    @request_form_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@request_form_types)
  end

  def show
    respond_with(@request_form_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @request_form_type = RequestFormType.new
    respond_with(@request_form_type)
  end

  def edit
  end

  def create
    @request_form_type.save
    respond_with(@request_form_type)
  end

  def update
    @request_form_type.update_attributes(request_form_type_params)
    respond_with(@request_form_type)
  end

  def destroy
    @request_form_type.destroy
    respond_with(@request_form_type)
  end

  protected

    def request_form_type_params
      params.require(:request_form_type).permit(:kind, :description, :active)
    end
end
