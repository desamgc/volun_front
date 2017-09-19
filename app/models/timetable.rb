class Timetable < ActiveRecord::Base
  belongs_to :event
  has_one :activity, as: :eventable, through: :event, class_name: '::Activity'
  has_one :project, as: :eventable,  through: :event
  has_one :address, through: :event
end
