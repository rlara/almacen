# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130724162218) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.text     "location"
    t.boolean  "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moves", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "branch_id"
    t.decimal  "existence"
    t.datetime "date_move"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "moves", ["branch_id"], :name => "index_moves_on_branch_id"
  add_index "moves", ["order_id"], :name => "index_moves_on_order_id"
  add_index "moves", ["product_id"], :name => "index_moves_on_product_id"

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "quantity"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "price"
  end

  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"
  add_index "order_details", ["product_id"], :name => "index_order_details_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "branch_id"
    t.string   "mode"
    t.integer  "destination"
    t.integer  "user_id"
    t.date     "date"
    t.string   "dealer"
    t.integer  "atach"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "action"
    t.boolean  "isclose"
  end

  add_index "orders", ["branch_id"], :name => "index_orders_on_branch_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "sku"
    t.date     "date"
    t.decimal  "price"
    t.string   "units"
    t.boolean  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "category"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "stock_ms", :force => true do |t|
    t.integer  "branch_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "day"
    t.integer  "quantity"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.boolean  "status",                 :default => false
    t.string   "username"
    t.integer  "branch_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
