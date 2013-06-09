class CreateUserDeals < ActiveRecord::Migration
  def up
  	create_table :user_deals do |t|
  		t.integer :user_id
  		t.integer :deal_id
  		t.timestamps
  	end
  end

  def down
  	drop_table :user_deals
  end
end
