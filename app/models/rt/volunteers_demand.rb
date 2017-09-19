class Rt::VolunteersDemand < ActiveRecord::Base
  include RtCommons
  belongs_to :project

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :notes, :road_type, :road_name, :number_type, :road_number, :postal_code, :province,
            :town, :description, :execution_start_date, :requested_volunteers_num, :volunteers_profile,
            :volunteer_functions_1, presence: true
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
end
