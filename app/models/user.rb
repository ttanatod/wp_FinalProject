class User < ApplicationRecord
	validates :username, :email, presence: true, uniqueness: true
	validates :firstname, :lastname, presence: true
	validates :password, presence: true, length: {minimum: 4}
	has_secure_password

	
end
