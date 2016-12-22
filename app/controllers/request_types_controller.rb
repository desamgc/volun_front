class RequestTypesController < ApplicationController

  respond_to :html, :js, :json

  def index
    params[:q] ||= RequestType.ransack_default
    @search_q = @request_types.search(params[:q])
    @request_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@request_types)
  end

  def show
    respond_with(@request_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @request_type = RequestType.new
    respond_with(@request_type)
  end

  def edit
  end

  def create
    @request_type.save
    respond_with(@request_type)
  end

  def update
    @request_type.update_attributes(request_type_params)
    respond_with(@request_type)
  end

  def destroy
    @request_type.destroy
    respond_with(@request_type)
  end

  protected

    def request_type_params
      params.require(:request_type).permit(:kind, :description, :active)
    end
end
