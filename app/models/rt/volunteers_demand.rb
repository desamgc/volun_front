class Rt::VolunteersDemand < ActiveRecord::Base
  include RtCommons
  belongs_to :project
  belongs_to :province
  belongs_to :road_type
  
  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :road_type_id, :road_name, :number_type, :road_number, :postal_code, :province_id,
            :town, :description, :execution_start_date, :requested_volunteers_num, :volunteers_profile,
            :volunteer_functions_1, presence: true
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
            
end
