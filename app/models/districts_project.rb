class DistrictsProject < ActiveRecord::Base
  belongs_to :district
  belongs_to :project
end
