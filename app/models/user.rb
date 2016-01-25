class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password 
	# validates_presence_of :password, on: :create
	validates :email, presence: true, uniqueness: true, on: :create
	# validates_presence_of :location
	has_many :boats, dependent: :destroy
	has_many :jobs, dependent: :destroy
	
	# has_many :boats, through:userfollowship
end


# UserFollowship.rb

# User 				Ships
# user1	(Bob)		ship1, ship3, ship4
# user2 (Moe)	    ship2

			# UserFolloship Joint Table

			# user_id	ship_id
			# 2			#3
			# Moe is following Bob's ship3

# the ships followed by a user would be written as
# user.userfollowship

