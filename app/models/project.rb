# class de projects of voluntaries
class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :entity
  has_many   :links, as: :linkable
  has_many   :documents
  has_many   :activities
  has_many   :events, as: :eventable

  has_many :addresses, through: :events

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :links

  scope :featured, -> { where("publish = true and projects.active = true and insured = true") }
  scope :actives, -> { where("publish = true and projects.active = true and insured = false") }
  scope :entity_projects, ->(id) { where("entity_id = ?", id) }
  scope :image_featured, -> { where(links: {kind: 1, active: 1 }) }
  #scope :images_projects, -> { includes(:links).where("links.kind=1 and links.active=1") }
  scope :urls_projects, -> { where("links.kind = 2") }
  scope :videos_projects, -> { where("links.kind = 3") }

  def self.ransack_default
    {s: 'id desc'}
  end
  
end
