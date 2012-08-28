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

ActiveRecord::Schema.define(:version => 20120824141500) do

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
    t.integer  "entry"
    t.integer  "output"
    t.integer  "existence"
    t.decimal  "amount_d"
    t.decimal  "amount_h"
    t.decimal  "amount_s"
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
    t.string   "quantity"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"
  add_index "order_details", ["product_id"], :name => "index_order_details_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "branch_id"
    t.string   "mode"
    t.string   "destination"
    t.string   "user_id"
    t.string   "dealer"
    t.integer  "atach"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "orders", ["branch_id"], :name => "index_orders_on_branch_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "sku"
    t.date     "date"
    t.decimal  "price"
    t.string   "units"
    t.boolean  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

end
