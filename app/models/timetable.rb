class Timetable < ActiveRecord::Base
enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]


end
