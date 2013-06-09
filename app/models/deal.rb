class Deal < ActiveRecord::Base
  attr_accessible :description, :featured, :picture, :waspurchased, :redeemable, :starts_at, :ends_at, :image

  has_many :user_deals
  has_many :users, through: :user_deals

  belongs_to :business

  has_attached_file :image, styles: { medium: "240x180>" }
end
