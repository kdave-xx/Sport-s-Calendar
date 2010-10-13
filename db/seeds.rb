# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
AdminUser.create(:login => 'admin', :email => "admin@admin.com", :password => 'admin', :password_confirmation => 'admin')
Shipping.create(:price => 10.0, :delivery_charge => 3.64)