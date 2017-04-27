class AddressesController < ApplicationController
  respond_to :html, :js, :json

  def index
    params[:q] ||= Address.ransack_default
    @search_q = @addresses.search(params[:q])
    @addresses = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@addresses)
  end

  def show
    respond_with(@address) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @address = Address.new
    respond_with(@address)
  end

  def edit
  end

  def create
    @address.save
    respond_with(@address)
  end

  def update
    @address.update_attributes(address_params)
    respond_with(@address)
  end

  def destroy
    @address.destroy
    respond_with(@address)
  end

  def bdc_search_towns
    @address = Address.new(address_params)
    respond_with(@address) do |format|
      format.json { render json: { towns: @address.bdc_validator.search_towns } }
    end
  end

  def bdc_search_roads
    @address = Address.new(address_params)
    respond_with(@address) do |format|
      format.json {
        render json: { roads: @address.bdc_validator.search_roads }
      }
    end
  end

  def bdc_search_road_numbers
    @address = Address.new(address_params)
    respond_with(@address) do |format|
      format.json {
        render json: { numbers: @address.bdc_validator.search_road_numbers }
      }
    end
  end

  protected

    def address_params
      params
        .require(:address)
        .permit(
          :road_type,
          :road_name,
          :road_number_type,
          :road_number,
          :grader,
          :stairs,
          :floor,
          :door,
          :postal_code,
          :town,
          :province,
          :country,
          :ndp_code,
          :local_code,
          :class_name,
          :normalize
        )
    end
end