module RequestFormTypeCommons
  extend ActiveSupport::Concern

  included do

    belongs_to :request_form_type, required: true
    belongs_to :request_form, required: true
    accepts_nested_attributes_for :request_form
    accepts_nested_attributes_for :request_form_type

    validate :check_request_form_type
    after_initialize :set_request_form_type
    after_initialize :build_new_request_form

    def self.my_type
      model_name.singular.sub(/rft_/,'')
    end

    private

    def get_related_request_form_type
      RequestFormType.get_request_form_type(self.class.my_type)
    end

    def set_request_form_type
      self.request_form_type_id ||= request_form.try(:request_form_type_id) || get_related_request_form_type.id
    end

    def build_new_request_form
      return if request_form_type_id || request_form
      build_request_form
      request_form.request_form_type_id = request_form_type_id
      request_form
    end

    def request_form_type_valid?
      request_form_type_id == get_related_request_form_type.id
    end

    def check_request_form_type
      errors.add(:request_form_type_id, :invalid_request_form_type) unless request_form_type_valid?
    end

  end
end