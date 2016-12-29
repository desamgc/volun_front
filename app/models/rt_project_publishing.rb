class RtProjectPublishing < ActiveRecord::Base
  has_one :request_form, as: :rt_extendable	
  belongs_to :road_type
  belongs_to :province
  belongs_to :entity
  belongs_to :project
  validates :description, :road_type_id, :road_name, :number_type, :road_number, :postal_code, :province_id,
            :town, presence: true
  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }

end
