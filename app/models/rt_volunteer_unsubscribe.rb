# model for volunteer unsubscribe
class RtVolunteerUnsubscribe < ActiveRecord::Base
  belongs_to :user
  has_one :request_form, as: :rt_extendable
  validates :reason, presence: true
end
