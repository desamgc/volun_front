class RequestFormType < ActiveRecord::Base
  
  enum kind: %i(
          volunteer_subscribe
          
       )

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
