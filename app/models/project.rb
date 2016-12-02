# class de projects of voluntaries
class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :entity
  has_many   :images
  has_many   :links
  has_and_belongs_to_many :districts, -> { order('districts.name asc') }


  scope :featured, -> { where("insured = true and active = true") }
  scope :actives, -> { where("active = true") }
end
