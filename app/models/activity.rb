class Activity < ActiveRecord::Base
  has_many   :links, as: :linkable
  has_many   :events, as: :eventable
  belongs_to :entity


  def to_s
    name
  end


  def self.ransack_default
    {s: 'id desc'}
  end

end
