class RequestForm < ActiveRecord::Base

  belongs_to :request_form_type
  belongs_to :rejection_type



  def extended_request_form_model
    "Rt#{request_form_type.kind.classify}".constantize
  end

  def extended_project(join_tables = :request_form)
    @extended_request_form ||= fetch_extended_request_form(join_tables)
  end

  def fetch_extended_request_form(join_tables = :request_form)
    extended_request_form_model.includes(join_tables).where(request_form_id: id).take
  end
end
