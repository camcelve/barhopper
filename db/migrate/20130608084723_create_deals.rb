class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.text :description
      t.string :picture
      t.boolean :featured

      t.timestamps
    end
  end
end
