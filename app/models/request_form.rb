class RequestForm < ActiveRecord::Base
  #before_save :set_default_values, on: :create
  belongs_to :request_type
  belongs_to :rejection_type
  belongs_to :user
  belongs_to :rt_extendable, polymorphic: true

  accepts_nested_attributes_for :rt_extendable

  private

  def set_default_values
    self.status = 0
    self.sent_at = Time.now
    self.status_date = Time.now
    self.rejection_type_id = 1
    self.request_type = RequestType.get_request_form_type(self.rt_extendable_type)
  end  

end
