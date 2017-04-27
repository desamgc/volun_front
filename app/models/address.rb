class Address < ActiveRecord::Base
  include BdcCompatible

  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']
  validates :road_name, :road_number, :postal_code, :town, presence: true
end
