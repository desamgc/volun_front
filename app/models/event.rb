class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  belongs_to :address
  has_many :timetables
end
