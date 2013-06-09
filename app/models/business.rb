class Business < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :phone_number, :image, :password

  has_many :deals
  has_many :user_businesses
  has_many :users, through: :user_businesses

  has_secure_password

  has_attached_file :image, styles: { medium: "240x180>" }
end
