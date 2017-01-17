class RtActivityUnpublishing < ActiveRecord::Base
  include RtCommons	
  validates :reason, presence: true


end
