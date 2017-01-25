class Rt::ActivityUnpublishing < ActiveRecord::Base
  include RtCommons	
  validates :reason, presence: true


end
