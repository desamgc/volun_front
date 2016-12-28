# model for volunteer amendment
class RtVolunteerAmendment < ActiveRecord::Base
  belongs_to :volunteer
  has_one :request_form, as: :rt_extendable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/

  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :phone_number_alt, format: { with: VALID_PHONE_NUMBER_REGEX, if: -> { phone_number_alt.present? } }
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :road_type_id, :road_name, :number_type, :road_number, :postal_code, :province_id,
            :town, presence: true
end
