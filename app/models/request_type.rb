class RequestType < ActiveRecord::Base
  
enum kind: {
    RtVolunteerSubscribe:  0,   # 
    RtEntitySubscribe:     1,   # 
    RtVolunteerAmendment:  2,   # 
    RtVolunteerUnsubscribe:3,   # 
    RtVolunteerAppoinment: 4,   # 
    RtVolunteersDemand:    5,   # 
    RtProjectPublishing:   6,   # 
    RtActivityPublishing:  7,    #
    RtOther:  8,    # 
    RtProjectUnsubscribe:   9,   #  
    RtEntityUnsubscribe:    10,   # 
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
