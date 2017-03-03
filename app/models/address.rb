class Address < ActiveRecord::Base
  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']

  #belongs_to :road_type
  #belongs_to :province
  #belongs_to :district
  
  #validates :road_type, :road_name, :road_number, :postal_code, :province, :country, :town, presence: true
  validates :road_name, :road_number, :postal_code, :country, :town, presence: true

  #scope :actives, -> { where("event.eventable = 'project' and publish = true") }

end
