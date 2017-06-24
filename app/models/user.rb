class User < ApplicationRecord
	before_save {self.email = email.downcase}
	validates :name, length: {maximum: 50}, presence: true
	validates :email, presence: true, length: {maximum: 100}, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: {minimum: 6},on: :create
	validates :gender, presence: true
	validates :acctype, presence: true, on: :create
	validates :dob, presence: true
end
