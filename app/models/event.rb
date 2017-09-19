class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  belongs_to :address
  has_many :timetables
  belongs_to :project,  (-> { includes(:events).where(events: { eventable_type: Project.name  }) }), :foreign_key => 'eventable_id'
  belongs_to :activity, (-> { includes(:events).where(events: { eventable_type: Activity.name }) }), :foreign_key => 'eventable_id'

  default_scope  { where(publish: true )}

end
