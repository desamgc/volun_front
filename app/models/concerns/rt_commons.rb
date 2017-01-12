module RtCommons
  extend ActiveSupport::Concern

  included do

    has_one :request_form, as: :rt_extendable, required: true
    belongs_to :user
    
    accepts_nested_attributes_for :request_form

    validate :check_request_type
    after_initialize :build_new_request_form

    private

    def request_type_valid?
      
      self.class.model_name.singular.camelize == request_form.request_type.kind
    end

    def check_request_type
      errors.add(:base, :invalid_request_type) unless request_type_valid?
    end

    def build_new_request_form(attributes = {})
      return if persisted? || request_form
      attributes.reverse_merge!(
        
        request_type: RequestType.where(kind: RequestType.kinds[self.class.model_name.singular.camelize]).take,
        status:  0,
        sent_at: Time.now,
        status_date:  Time.now,
        rejection_type_id:  1,
        #request_type: RequestType.get_request_form_type(self.rt_extendable_type)
      )
      build_request_form(attributes)
      
    end

  end
end