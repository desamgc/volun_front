# areas of project
class AreasProject < ActiveRecord::Base
  belongs_to :area
  belongs_to :project
end
