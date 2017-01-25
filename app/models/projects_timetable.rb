class ProjectsTimetable < ActiveRecord::Base

  belongs_to :project
  belongs_to :timetable


end
