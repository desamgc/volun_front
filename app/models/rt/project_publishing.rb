class Rt::ProjectPublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :entity
  belongs_to :project
  validates :description, :road_type, :road_name, :number_type, :road_number, :postal_code, :province,
            :town, presence: true
  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }

end
