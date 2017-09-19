# areas of project
class ProjectsVolunteer < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :project
end
