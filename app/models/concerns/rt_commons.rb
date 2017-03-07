module RtCommons
  extend ActiveSupport::Concern

  included do

    has_one :request_form, as: :rt_extendable, required: true
    accepts_nested_attributes_for :request_form

    validate :check_request_type
    after_initialize :build_new_request_form

    private

    def request_type_valid?
      self.class.model_name.singular == request_form.request_type.kind
    end

    def check_request_type
      errors.add(:base, :invalid_request_type) unless request_type_valid?
    end

    def build_new_request_form(attributes = {})
      return if persisted?
      attributes.reverse_merge!(
        request_type: RequestType.where(kind: RequestType.kinds[self.class.model_name.singular]).take,
        req_status_id:  1,
        status_date:  Time.now,
        req_rejection_type_id:  1,
        req_reason_id:  self.request_form != nil ? self.request_form.req_reason_id : nil
        #request_type: RequestType.get_request_form_type(self.rt_extendable_type)
      )
      build_request_form(attributes)
      
    end

  end
end