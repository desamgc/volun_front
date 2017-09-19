# request publish activity
class Rt::ActivityPublishing < ActiveRecord::Base
  include RtCommons
  belongs_to :project

  VALID_CODIGOPOSTAL_REGEX = /\A(\d{5})\z/
  validates :name, :description, :organizer, presence: true
  validates :dates_text_free, :hours_text_free, :places_text_free, presence: true
  def to_s
    name
  end
end
