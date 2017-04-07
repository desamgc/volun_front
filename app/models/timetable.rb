class Timetable < ActiveRecord::Base
  belongs_to :event
  has_one :activity, through: :event
  has_one :address, through: :event

  scope :activity_with_day, ->(day, id_activity) { joins(:event).where("execution_date = ? and eventable_type='Activity and eventable_id=?", day, id_activity) }
  scope :activities, -> { joins(:event).where("eventable_type='Activity'") }

  scope :with_day, ->(day) { joins(:event).where('execution_date = ?', day) }
end
