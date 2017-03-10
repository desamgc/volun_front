class Pt::Subvention < ActiveRecord::Base
  include PtModel

  belongs_to :proposal

  validates :representative_name, presence: true
  validates :cost, :requested_amount, :subsidized_amount, :initial_volunteers_num, numericality: { allow_blank: true }
end
