class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  belongs_to :address
  has_many :timetables
  belongs_to :project,  -> { where(events: { eventable_type: Project.name  }) }, foreign_key: 'eventable_id'
  belongs_to :activity, -> { where(events: { eventable_type: Activity.name }) }, foreign_key: 'eventable_id'
  
  scope :activities_present, ->(day) { where("timetables.execution_date >= ? and eventable_type='Activity'", day) }
  scope :activities, -> { where("eventable_type='Activity'") }
end
