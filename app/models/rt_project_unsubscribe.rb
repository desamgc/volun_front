class RtProjectUnsubscribe < ActiveRecord::Base

  belongs_to :project
  has_one :request_form, as: :rt_extendable
  validates :reason, presence: true

  accepts_nested_attributes_for :project

end
