# model of volunteer subscribe
class RtVolunteerSubscribe < ActiveRecord::Base
  has_one :request_form, as: :rt_extendable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/
  validates :name, presence: true
  validates :first_surname, presence: true
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :phone_number_alt, format: { with: VALID_PHONE_NUMBER_REGEX, if: -> { phone_number_alt.present? } }
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :postal_code, format: { with: VALID_CODIGOPOSTAL_REGEX }
  
  def to_s
    name
  end
end
