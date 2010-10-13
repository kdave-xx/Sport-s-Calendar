class CreateOrederTransactions < ActiveRecord::Migration
  def self.up
    create_table :oreder_transactions do |t|
      t.integer :order_id
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params
      t.timestamps
    end
  end

  def self.down
    drop_table :oreder_transactions
  end
end
