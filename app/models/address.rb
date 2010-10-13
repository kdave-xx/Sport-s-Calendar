class Address < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :billing_address, :billing_city, :billing_state, :billing_pincode
end
