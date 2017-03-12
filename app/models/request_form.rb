class RequestForm < ActiveRecord::Base
  belongs_to :request_type
  belongs_to :req_rejection_type
  belongs_to :user
  belongs_to :rt_extendable, polymorphic: true
  belongs_to :req_reason

  accepts_nested_attributes_for :rt_extendable
end
