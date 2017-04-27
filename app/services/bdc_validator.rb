class BdcValidator

  attr_accessor :bdc_fields, :response_data

  def initialize(bdc_fields = {})
    self.bdc_fields    = bdc_fields.with_indifferent_access
    self.response_data = {}
  end

  def validate_address(bdc_fields = self.bdc_fields)
    response           = client.call(:validar_direccion, message: bdc_fields)
    self.response_data = Hash.deep_strip!(response.body[:validar_direccion_response][:validar_direccion_return] || {})
  rescue  Exception  => e
    Rails.logger.error('BdcValidator#validate_address') do
      "Error when calling BDC: \"validar_direccion\" - #{bdc_fields}: \n#{e}"
    end
    {}
  end

  def address_normalized?
    bdc_fields_msg = {
      nom_pais:       bdc_fields[:country],
      nom_provincia:  bdc_fields[:province],
      nom_pueblo:     bdc_fields[:town],
      nom_clase:      bdc_fields[:road_type],
      nom_vial:       bdc_fields[:road_name],
      nom_app:        bdc_fields[:road_number_type],
      num_app:        bdc_fields[:road_number],
      cal_app:        bdc_fields[:grader].present? ? bdc_fields[:grader] : '  ',
      escalera:       bdc_fields[:stairs],
      planta:         bdc_fields[:floor],
      puerta:         bdc_fields[:door],
      intercambioBDC: '',
      aplicacion:     Rails.application.secrets.bdc_app_name
    }

    validate_address(bdc_fields_msg)
    ndp_code.present?
  end

  def address_block
    response_data[:bloquedireccion] || {}
  end

  def address_data
    address_block[:datosdireccion] || {}
  end

  def country_block
    address_data[:bloquepais] || {}
  end

  def province_block
    country_block[:bloqueprovincia] || {}
  end

  def town_block
    province_block[:bloquepoblacion] || {}
  end

  def road_block
    town_block[:bloquevial] || {}
  end

  def number_block
    road_block[:bloquenumero] || {}
  end

  def local_block
    number_block[:bloquelocal] || {}
  end

  def road_type
    road_block[:nomclase]
  end

  def ndp_code
    number_block[:coddireccion]
  end

  def province_code
    province_block[:codprovincia]
  end

  def town_code
    town_block[:codpoblacion]
  end

  def district_code
    number_block[:coddistrito]
  end

  def local_code
    local_block[:codlocal]
  end

  def latitude
    number_block[:coordx]
  end

  def longitude
    number_block[:coordy]
  end

  def postal_code
    number_block[:codpostal]
  end

  def road_number
    number_block.presence
  end

  def road_name
    road_block.presence
  end

  def road_town
    town_block.presence
  end

  def road_province
    province_block.presence
  end

  def road_country
    country_block.presence
  end

  def road_types
    road_block.dig(:numeros, :numero) || [road_type].compact
  end

  def road_numbers
    road_block.dig(:numeros, :numero) || [road_number].compact
  end

  def road_names
    town_block.dig(:viales, :vial) || [road_name].compact
  end

  def road_towns
    province_block.dig(:poblaciones, :poblacion) || [road_town].compact
  end

  def road_provinces
    country_block.dig(:provincias, :provincia) || [road_province].compact
  end

  def road_countries
    address_data.dig(:paises, :pais) || [road_country].compact
  end

  def province
    province_block[:nomprovincia]
  end

  def town
    town_block[:nompoblacion]
  end

  def district
    number_block[:distrito]
  end

  def borough
    number_block[:barrio]
  end

  def valid?
    number_block.present?
  end

  def valid_bdc_fields?
    bdc_fields[:country].present? && bdc_fields[:province].present?
  end

  def search_towns
    return [] unless valid_bdc_fields? && bdc_fields[:town].present?
    validate_address(bdc_fields_msg)
    road_towns.map { |town| town[:nompoblacion] }
  end

  def search_roads
    return unless valid_bdc_fields?
    validate_address(bdc_fields_msg)
    _road_names = [road_names].flatten
    _road_names.select! { |road| road[:nomclase] == bdc_fields[:road_type] } if bdc_fields[:road_type].present?
    _road_names.sort_by { |road| road[:nomvial] }
  end

  def search_road_numbers
    return unless valid_bdc_fields?
    validate_address(bdc_fields_msg.merge(nom_clase: bdc_fields[:road_type] || ''))
    road_numbers
  end

  def search_road_types
    return unless valid_bdc_fields?
    validate_address(bdc_fields_msg.merge(nom_clase: bdc_fields[:road_type] || ''))
    road_numbers
  end

  private

    def client
      @client ||= Savon.client(wsdl: Rails.application.secrets.bdc_wsdl, raise_errors: true)
    end

    def bdc_fields_msg
      {
        nom_pais:       bdc_fields[:country],
        nom_provincia:  bdc_fields[:province],
        nom_pueblo:     bdc_fields[:town],
        nom_clase:      '',
        nom_vial:       bdc_fields[:road_name].present? ? bdc_fields[:road_name] : 'X',
        nom_app:        '',
        num_app:        '0',
        cal_app:        '',
        escalera:       '',
        planta:         '',
        puerta:         '',
        intercambioBDC: '',
        aplicacion:     Rails.application.secrets.bdc_app_name
      }
    end
end