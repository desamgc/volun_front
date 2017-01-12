# model for volunteer unsubscribe
class RtVolunteerUnsubscribe < ActiveRecord::Base
  include RtCommons
  validates :reason, presence: true
end
