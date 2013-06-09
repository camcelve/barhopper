class AddStartsAtToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :starts_at, :date_time
  end
end
