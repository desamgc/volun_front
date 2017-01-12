class RtOther < ActiveRecord::Base
  include RtCommons
  
  validates :description, presence: true
end
