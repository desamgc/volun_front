class RequestForm < ActiveRecord::Base

  belongs_to :request_type
  belongs_to :rejection_type
  belongs_to :rt_extendable, polymorphic: true
  before_save :default_values
  
  accepts_nested_attributes_for :rt_extendable

  def self.main_columns
    %i(id request_type_id)
  end

  def self.ransack_default
    {s: 'id desc'}
  end

  def to_s
    name
  end

  def rt_extendable_class
    @rt_extendable_class ||= rt_extendable.try(:class) || request_type.kind.classify.constantize
  end

  def build_rt_extendable(rt_extension_kind)
    return unless rt_extension_kind.to_s.in? RequestType.rt_extension_tables
    self.rt_extendable ||= rt_extendable_class.new
  end

  def default_values
    self.status ||= 0
    self.request_type_id = 1
  end


  
end
