# class de projects of voluntaries
class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :entity
  has_many   :images
  has_many   :links
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :timetables
  has_and_belongs_to_many :districts, -> { order('districts.name asc') }

  accepts_nested_attributes_for :timetables, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :addresses,  allow_destroy: true, reject_if: :all_blank

  scope :featured, -> { where("insured = true and active = true") }
  scope :actives, -> { where("active = true") }
  scope :entity_projects, ->(id) { where("entity_id = ?", id) }

  def self.ransack_default
    {s: 'id desc'}
  end
  
end
