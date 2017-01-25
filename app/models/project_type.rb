class ProjectType < ActiveRecord::Base

  enum kind: {
    pt_social:     1,
    pt_centre:     2,
    pt_permanent:  3,
    pt_punctual:   4,
    pt_entity:     5,
    pt_subvention: 6,
    pt_other:      7
  }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def extendable?
    kind.classify.sub(/\APt/, 'Pt::').safe_constantize.present?
  end

  def to_s
    #kind_i18n
  end	
end
