# request publish activity
class Rt::ActivityPublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :project

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :road_type, :road_name, :number_type, :road_number, :postal_code, :province,
            :town, :name, :description, :execution_date,  :organizer, presence: true
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
  validates :execution_hour, format: { with: /\A(?:(([01][0-9])|(2[0-4])):([0-5][0-9]))\z/ }, allow_blank: false

  def to_s
    name
  end

end
