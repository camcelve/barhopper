class Deal < ActiveRecord::Base
  attr_accessible :description, :featured, :picture, :waspurchased

  has_many :user_deals
  has_many :users, through: :user_deals

  belongs_to :business
end
