class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  belongs_to :loggable, polymorphic: true
  belongs_to :notice_type

  scope :count_email, ->(email) { where('email = ?', email).count }

  accepts_nested_attributes_for :loggable
  #validates_acceptance_of :terms_of_service, :allow_nil => false, :message => :terms_not_accepted, :on => :create
  validates :terms_of_service, acceptance: { allow_nil: false }, on: :create

end
