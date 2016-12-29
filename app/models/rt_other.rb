class RtOther < ActiveRecord::Base
  has_one :request_form, as: :rt_extendable	
  belongs_to :entity
 
  validates :description, presence: true
end
