class RftVolunteerSubscribe < ActiveRecord::Base
  include RequestFormTypeCommons	
  belongs_to :request_form_type

end
