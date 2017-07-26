# request unpublish activity
class Rt::ActivityUnpublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :activity, required: true
  validates :notes, presence: true
end
