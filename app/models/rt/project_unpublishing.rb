class Rt::ProjectUnpublishing < ActiveRecord::Base
  include RtCommons	
  validates :notes, presence: true	
end
