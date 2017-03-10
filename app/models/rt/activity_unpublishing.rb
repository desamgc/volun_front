# request unpublish activity
class Rt::ActivityUnpublishing < ActiveRecord::Base
  include RtCommons	
  belongs_to :activity
  validates :reason, presence: true
end
