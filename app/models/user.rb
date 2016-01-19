class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password 
	validates_presence_of :password, on: :create
	validates_presence_of :location
	has_many :boats, dependent: :destroy
	has_many :jobs, dependent: :destroy
end
