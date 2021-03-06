# model of volunteer subscribe
class Rt::VolunteerSubscribe < ActiveRecord::Base
  include RtCommons

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/
  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :phone_number_alt, format: { with: VALID_PHONE_NUMBER_REGEX, if: -> { phone_number_alt.present? } }
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { scope: :project_id, case_sensitive: false }

  def to_s
    name
  end
end
