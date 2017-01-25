class Rt::EntityUnsubscribe < ActiveRecord::Base
  include RtCommons	
  validates :reason, presence: true

end
