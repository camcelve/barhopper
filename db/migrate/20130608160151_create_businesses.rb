class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
