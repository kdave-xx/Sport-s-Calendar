class Address < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :billing_address, :billing_city, :billing_state, :billing_pincode
#  validates_numericality_of :billing_pincode
#  validates_format_of :billing_pincode, :with => %r{\d{5}(-\d{4})?}, :message => "should be contain 5 numbers"
end
