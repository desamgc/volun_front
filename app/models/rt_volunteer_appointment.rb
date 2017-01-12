# model for volunteer appoinment
class RtVolunteerAppointment < ActiveRecord::Base
  include RtCommons
  
  validates :reason, presence: true
end
