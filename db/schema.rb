# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101012084302) do

  create_table "addresses", :force => true do |t|
    t.integer  "order_id"
    t.text     "billing_address"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_country"
    t.integer  "billing_pincode"
    t.text     "shipping_address"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_country"
    t.integer  "shipping_pincode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_images", :force => true do |t|
    t.integer  "image_id"
    t.integer  "calendar_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", :force => true do |t|
    t.integer  "layout_id"
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "page_id"
    t.boolean  "is_admin",                :default => false
    t.boolean  "boolean",                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "status",          :default => "Pending"
    t.integer  "quantity"
    t.float    "total_price"
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.date     "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oreder_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shippings", :force => true do |t|
    t.float    "price"
    t.float    "delivery_charge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
