class AddRedeemableToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :redeemable, :boolean
  end
end
