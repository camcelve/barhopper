class Deal < ActiveRecord::Base
  attr_accessible :description, :featured, :picture

  belongs_to :business
end
