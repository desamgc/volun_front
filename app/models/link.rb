class Link < ActiveRecord::Base
  enum link_type_id: {
    logo:  1,
    image: 2,
    url:   3,
    video: 4
  }
  belongs_to :linkable, polymorphic: true
end
