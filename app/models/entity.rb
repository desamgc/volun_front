class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :projects
  belongs_to :address
  has_many :links, as: :linkable
end
