class Voluntary < ActiveRecord::Base
	has_many :user, as: :profile
end