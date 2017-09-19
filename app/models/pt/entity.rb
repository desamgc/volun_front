class Pt::Entity < ActiveRecord::Base
  include PtModel

  validates :derived_volunteers_num, :added_volunteers_num, numericality: { allow_blank: true }
end
