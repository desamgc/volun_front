class RtVolunteersDemand < ActiveRecord::Base
	belongs_to :entity
	belongs_to :project
	belongs_to :province
	belongs_to :road_type
  has_one :request_form, as: :rt_extendable

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :road_type_id, :road_name, :number_type, :road_number, :postal_code, :province_id,
            :town, :description, :execution_start_date, :requested_volunteers_num, :volunteers_profile,
            :volunteer_functions_1, :entity_id, presence: true
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
            
end
