class Shipping < ActiveRecord::Base
  validates_presence_of :price, :delivery_charge
end
