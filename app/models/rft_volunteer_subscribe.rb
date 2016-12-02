class RftVolunteerSubscribe < ActiveRecord::Base

  belongs_to :request_form_type

  def to_s
    name
  end

end
