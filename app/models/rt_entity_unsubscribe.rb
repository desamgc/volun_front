class RtEntityUnsubscribe < ActiveRecord::Base
  include RtCommons	
  validates :reason, presence: true

end
