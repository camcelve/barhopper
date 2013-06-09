class AddWaspurchasedToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :waspurchased, :boolean
  end
end
