# class de projects of voluntaries
class Project < ActiveRecord::Base
  belongs_to :pt_extendable, polymorphic: true
  belongs_to :project_type
  belongs_to :entity
  has_many   :links, as: :linkable
  has_many   :documents
  has_many   :activities
  has_many   :events, as: :eventable

  has_many :addresses, through: :events
  #has_many :districts, through: :addresses
  has_and_belongs_to_many :areas, -> { where(active: true).order('areas.name asc') }

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :links

  scope :featured, -> { where("projects.publish = true and projects.active = true and projects.insured = true") }
  scope :actives, -> { where("projects.publish = true and projects.active = true and projects.insured = false") }
  scope :outstanding, -> { where("projects.publish = true and projects.active = true and projects.outstanding = true") }
  scope :entity_projects, ->(id) { where("entity_id = ?", id) }
  scope :image_featured, -> { where(links: {kind: 1, active: 1 }) }
  #scope :images_projects, -> { includes(:links).where("links.kind=1 and links.active=1") }
  scope :urls_projects, -> { where("links.kind = 2") }
  scope :videos_projects, -> { where("links.kind = 3") }

  def self.ransack_default
    {s: 'id desc'}
  end
  
end
