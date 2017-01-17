class RequestType < ActiveRecord::Base
  
enum kind: {
    rt_volunteer_subscribe:    1,
    rt_volunteer_unsubscribe:  2,
    rt_volunteer_amendment:    3,
    rt_volunteer_appointment:  4,
    rt_entity_subscribe:       5,
    rt_entity_unsubscribe:     6,
    rt_volunteers_demand:      7,
    rt_project_publishing:     8,
    rt_project_unpublishing:   9,
    rt_project_unsubscribe:    10,
    rt_activity_publishing:    11,
    rt_activity_unpublishing:  12,
    rt_other:                  13
  }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.get_request_form_type(kind)
    send(kind).take
  end

  def extendable?
    kind.classify.sub(/\ARt/, 'Rt::').safe_constantize.present?
  end

  def to_s
    kind_i18n
  end



end
