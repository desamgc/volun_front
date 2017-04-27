# == BdcCompatible
# The class that includes this module must be an ActiveRecord subclass
# and must implement the following methods:
#
# +country+
# +province+
# +town+
# +road_type+
# +road_name+
# +road_number_type+
# +road_number+
# +grader+
# +stairs+
# +floor+
# +door+
# +ndp_code+
# +province+
# +province_code+
# +town+
# +town_code+
# +district+
# +district_code+
# +borough+
# +local_code+
# +latitude+
# +longitude+
# +normalize+
#

module BdcCompatible
  extend ActiveSupport::Concern

  included do

    attr_accessor :bdc_validator

    before_validation :check_normalization, if: 'normalize?'
    after_validation :unnormalize_fields, on: :update, unless: 'normalize?'

    def normalized?
      ndp_code.present?
    end

    def bdc_validator
      @bdc_validator ||= BdcValidator.new(bdc_fields)
    end

    def bdc_address_result
      bdc_validator.search_towns
    end

    def reset_bdc_validator
      unnormalize_fields
      self.bdc_validator = nil
    end

    private

    # BDC service need two white spaces in the grader field in order to look for
    # an address without a grader, thus an empty string will be ignored.
    def normalize_grader
      self.grader = '  ' if grader.blank?
    end

    def normalize_road_number
      self.road_number = road_number.to_s.to_i
    end

    def unnormalize_fields
      self.normalize     = false
      self.ndp_code      = nil
      self.province_code = nil
      self.town_code     = nil
      self.district      = nil
      self.district_code = nil
      self.borough       = nil
      self.local_code    = nil
      self.latitude      = nil
      self.longitude     = nil
    end

    def normalize_fields
      self.postal_code   = bdc_validator.postal_code || self.postal_code
      self.ndp_code      = bdc_validator.ndp_code
      self.province      = bdc_validator.province
      self.province_code = bdc_validator.province_code
      self.town          = bdc_validator.town
      self.town_code     = bdc_validator.town_code
      self.district      = bdc_validator.district
      self.district_code = bdc_validator.district_code
      self.borough       = bdc_validator.borough
      self.local_code    = bdc_validator.local_code
      self.latitude      = bdc_validator.latitude
      self.longitude     = bdc_validator.longitude
    end

    def check_normalization
      normalize_grader
      normalize_road_number
      if bdc_validator.address_normalized?
        normalize_fields
      elsif normalize?
        errors.add :base, :address_is_not_normalized
      end
    end

    def bdc_fields
      {
        country:          country.to_s,
        province:         province.to_s,
        town:             town.to_s,
        road_type:        road_type.to_s.upcase,
        road_name:        road_name.to_s,
        road_number_type: road_number_type.to_s,
        road_number:      road_number.to_s,
        grader:           grader.to_s,
        stairs:           stairs.to_s,
        floor:            floor.to_s,
        door:             door.to_s,
        bdc_exchange:     '',
        aplication:       Rails.application.secrets.bdc_app_name
      }
    end
  end

end