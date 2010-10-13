class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :calendar_id
      t.string :fname
      t.string :lname
      t.string :email
      t.string :status, :default => "Pending"
      t.integer :quantity
      t.float :total_price
      t.string :ip_address
      t.string :card_type
      t.date :card_expires_on
      t.date :purchased_at
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
