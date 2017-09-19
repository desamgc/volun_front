# model for volunteer amendment
class Rt::VolunteerAmendment < ActiveRecord::Base
  include RtCommons
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/

  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :phone_number_alt, format: { with: VALID_PHONE_NUMBER_REGEX, if: -> { phone_number_alt.present? } }
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :road_type, :road_name, :number_type, :road_number, :postal_code, :province,
            :town, presence: true
  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
end
