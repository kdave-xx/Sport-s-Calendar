class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer   :order_id
      t.text      :billing_address
      t.string    :billing_city
      t.string    :billing_state
      t.string    :billing_country
      t.string   :billing_pincode
      t.text      :shipping_address
      t.string    :shipping_city
      t.string    :shipping_state
      t.string    :shipping_country
      t.string   :shipping_pincode
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
