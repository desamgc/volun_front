# model for volunteer appoinment
class Rt::VolunteerAppointment < ActiveRecord::Base
  include RtCommons
  validates :notes, presence: true
end
