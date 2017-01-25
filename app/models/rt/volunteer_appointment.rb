# model for volunteer appoinment
class Rt::VolunteerAppointment < ActiveRecord::Base
  include RtCommons
  
  validates :reason, presence: true
end
