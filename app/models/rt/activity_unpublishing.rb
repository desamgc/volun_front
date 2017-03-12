# request unpublish activity
class Rt::ActivityUnpublishing < ActiveRecord::Base
  include RtCommons	
  belongs_to :activity
  validates :notes, presence: true
end
