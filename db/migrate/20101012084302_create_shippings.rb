class CreateShippings < ActiveRecord::Migration
  def self.up
    create_table :shippings do |t|
      t.float   :price
      t.float   :delivery_charge
      t.timestamps
    end
  end

  def self.down
    drop_table :shippings
  end
end
