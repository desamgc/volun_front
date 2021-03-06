class Activity < ActiveRecord::Base
  has_many   :links, as: :linkable
  has_many   :events, as: :eventable
  belongs_to :entity
  belongs_to :area
  belongs_to :project

  has_many :timetables, through: :events
  has_many :addresses, through: :events

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :links

  default_scope { where(publish: true, active: true) }
  scope :activities_present, (->(day) { where("timetables.execution_date >= ? and events.eventable_type='Activity'", day) })

  def to_s
    name
  end

  def self.ransack_default
    { s: 'id desc' }
  end
end
