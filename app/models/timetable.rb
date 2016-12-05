class Timetable < ActiveRecord::Base
	has_and_belongs_to_many :projects
	enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]


end
