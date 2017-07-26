class Rt::ProjectUnpublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :project, required: true
  validates :notes, presence: true
end
