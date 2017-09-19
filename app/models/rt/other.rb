class Rt::Other < ActiveRecord::Base
  include RtCommons
  validates :description, presence: true
end
