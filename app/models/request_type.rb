class RequestType < ActiveRecord::Base
  
enum kind: {
    RtVolunteerSubscribe:  0,   # project_type_social
    RtEntitySubscribe:     1,   # project_type_centre
    RtVolunteerAmendment:  2,   # project_type_social
    RtVolunteerUnsubscribe:  3,   # project_type_social
    RtVolunteerAppoinment:  4,   # project_type_social
    RtVolunteersDemand:  5,   # project_type_social
    RtProjectPublishing:  6,   # project_type_social
    RtActivityPublishing:  7   # project_type_social
}  

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.get_request_form_type(kind)
    send(kind).take
  end

  def to_s
    kind_i18n
  end

end
