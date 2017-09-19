class Volunteer < ActiveRecord::Base
  belongs_to :address
  has_and_belongs_to_many :projects, (-> { where(active: true).order('projects.name asc') })
end
