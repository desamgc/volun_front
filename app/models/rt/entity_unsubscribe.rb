# request entity unsubscribe
class Rt::EntityUnsubscribe < ActiveRecord::Base
  include RtCommons
  validates :notes, presence: true
end
