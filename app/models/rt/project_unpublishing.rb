class Rt::ProjectUnpublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :project
  validates :notes, presence: true
end
