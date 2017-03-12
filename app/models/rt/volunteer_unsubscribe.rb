# model for volunteer unsubscribe
class Rt::VolunteerUnsubscribe < ActiveRecord::Base
  include RtCommons
  validates :notes, presence: true
end
