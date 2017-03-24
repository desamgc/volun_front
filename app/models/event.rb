class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  belongs_to :address
  has_many :timetables
  belongs_to :project,  -> { includes(:events).where( events: {eventable_type:  'Project'}  ) }, foreign_key: 'eventable_id'
  belongs_to :activity,  -> { includes(:events).where( events: {eventable_type:  'Activity'}  ) }, foreign_key: 'eventable_id'
  #belongs_to :activity, -> { where(  "eventable_type = 'Activity'" ) }, foreign_key: 'eventable_id'

  #belongs_to :shop, -> { where(reviews: {reviewable_type: 'Shop'}) }, foreign_key: 'reviewable_id'

  scope :activities_present, ->(day) { where("timetables.execution_date >= ? and eventable_type='Activity'", day) }
  scope :activities, -> { where( eventable_type: 'Activity') }
  default_scope  { where(publish: true ) }
end
