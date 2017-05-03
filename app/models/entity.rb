class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :projects
  belongs_to :address
  has_many :links, as: :linkable
  has_one  :user, as: :loggable

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :address

  validates :name, uniqueness: true
  validates :name, :vat_number, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, :entity_type_id, :req_reason_id, presence: true
  validates :phone_number, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: false
  validates :phone_number_alt, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: false
  validates :vat_number, spanish_vat: true
  validates :other_subscribe_reason, presence: true, if: -> { req_reason_id == 4 }
end
