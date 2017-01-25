# model for volunteer unsubscribe
class Rt::VolunteerUnsubscribe < ActiveRecord::Base
  include RtCommons
  validates :reason, presence: true
end
