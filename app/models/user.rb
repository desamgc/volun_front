class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  belongs_to :loggable, polymorphic: true

  scope :count_email, ->(email) { where("email = ?", email).count }
end
     