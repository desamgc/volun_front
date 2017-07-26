# model for volunteer unsubscribe
class Rt::VolunteerUnsubscribe < ActiveRecord::Base
  include RtCommons
  belongs_to :project, required: true
  belongs_to :unsubscribe_level, required: false
  validates :notes, presence: true

  def to_s
    name
  end
end
