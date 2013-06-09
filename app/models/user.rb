class User < ActiveRecord::Base
 	has_many :user_businesses
 	has_many :businesses, through: :user_businesses

 	has_many :user_deals
 	has_many :deals, through: :user_deals

  has_secure_password
end
