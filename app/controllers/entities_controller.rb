class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @entity.build_address
    @entity.build_user
  end

  def create
    @entity = Entity.new(entity_params)
    set_user
    if @entity.save
      # create_and_assign_user_to_entity!(@entity,nil)
      redirect_to entities_path, notice: t('entity_subscribe.response')
    else
      respond_with(@entity)
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
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
      format.json { render json: { roads: @address.bdc_validator.search_roads } }
    end
  end

  def bdc_search_road_numbers
    @address = Address.new(address_params)
    respond_with(@address) do |format|
      format.json { render json: { numbers: @address.bdc_validator.search_road_numbers } }
    end
  end

  protected

  def entity_params
    params
      .require(:entity)
      .permit(
        :name,
        :description,
        :vat_number,
        :email,
        :representative_name,
        :representative_last_name,
        :representative_last_name_alt,
        :contact_name,
        :contact_last_name,
        :contact_last_name_alt,
        :phone_number,
        :phone_number_alt,
        :publish_pictures,
        :annual_survey,
        :req_reason_id,
        :entity_type_id,
        :comments,
        :other_subscribe_reason,
        :active,
        :subscribed_at,
        :unsubscribed_at,
        {
          address_attributes: [
            :id,
            :road_type,
            :road_name,
            :road_number_type,
            :road_number,
            :grader,
            :stairs,
            :floor,
            :door,
            :postal_code,
            :borough,
            :district,
            :town,
            :province,
            :country,
            :normalize,
            :_destroy
          ]
        },
        {
          user_attributes: [
            :id,
            :password,
            :password_confirmation,
            :terms_of_service
          ]
        }
      )
  end

  private

  def set_user
    @entity.address.normalize = false
    @entity.user.email = @entity.email
    @entity.user.login = @entity.email
    @entity.user.notice_type_id = 1
  end
end
