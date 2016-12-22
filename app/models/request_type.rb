class RequestType < ActiveRecord::Base
  
enum kind: {
    rt_volunteer_subscribe:    1,  # request_type_volunteer_subscribe
    rt_volunteer_unsubscribe:  2,  # request_type_volunteer_unsubscribe
    rt_volunteer_amendment:    3,  # request_type_volunteer_amendment
    rt_volunteer_appointment:  4,  # request_type_volunteer_appointment
    rt_entity_subscribe:       5,  # request_type_entity_subscribe
    rt_entity_unsubscribe:     6,  # request_type_entity_unsubscribe
    rt_volunteers_demand:      7,  # request_type_volunteers_demand
    rt_project_publishing:     8,  # request_type_project_publishing
    rt_project_unpublishing:   9,  # request_type_project_unpublishing
    rt_project_unsubscribe:    10,  # request_type_project_unsubscribe
    rt_activity_publishing:    11,  # request_type_activity_publishing
    rt_activity_unpublishing:  12,  # request_type_activity_unpublishing
    rt_other:                  13   # request_type_other
  }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.rt_extension_tables
    kinds.keys.select { |rt_extension| rt_extension.classify.safe_constantize }
  end

  def to_s
    kind_i18n
  end

end
