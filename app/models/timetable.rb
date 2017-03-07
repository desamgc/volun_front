class Timetable < ActiveRecord::Base
	belongs_to :event

	scope :with_day, ->(day) { where("execution_date = ?", day) }

end
