class AddBusinessidToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :business_id, :integer
  end
end
