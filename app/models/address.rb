class Address < ActiveRecord::Base
  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']
  validates :road_name, :road_number, :postal_code, :country, :town, presence: true
end
