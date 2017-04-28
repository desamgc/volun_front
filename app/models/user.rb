class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable #, :confirmable
  belongs_to :loggable, polymorphic: true
  belongs_to :notice_type

  scope :count_email, ->(email) { where('email = ?', email).count }


  #validates :terms_of_service, acceptance: { allow_nil: false }, on: :create

end
