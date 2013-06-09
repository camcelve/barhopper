class AddEndsAtToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :ends_at, :date_time
  end
end
