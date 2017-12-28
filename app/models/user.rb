class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable
  belongs_to :loggable, polymorphic: true
  belongs_to :notice_type

  attr_accessor :username

  scope :count_email, (->(email) { where('email = ?', email).count })

  validates :terms_of_service, presence: true, on: :create



  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:username)
    where(conditions).where(["lower(mobile_phone) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
