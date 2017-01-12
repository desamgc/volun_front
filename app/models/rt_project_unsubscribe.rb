class RtProjectUnsubscribe < ActiveRecord::Base
  include RtCommons	
  belongs_to :project
  validates :reason, presence: true

  accepts_nested_attributes_for :project

end
