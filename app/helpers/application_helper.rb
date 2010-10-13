# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def init_order(order)
    return nil unless order.instance_of? Order
    order.build_address if order.address.blank?order
  end
end
