class Rt::ProjectUnpublishing < ActiveRecord::Base
  include RtCommons	
  validates :reason, presence: true	


end
