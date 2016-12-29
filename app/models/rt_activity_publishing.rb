class RtActivityPublishing < ActiveRecord::Base
  has_one :request_form, as: :rt_extendable	 
  belongs_to :road_type
  belongs_to :province
  belongs_to :entity
  belongs_to :project

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :road_type_id, :road_name, :number_type, :road_number, :postal_code, :province_id,
            :town, :name, :description, :execution_date, :execution_hour, :organizer, :entity_id, presence: true
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }

  def to_s
    name
  end

end
