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

ActiveRecord::Schema.define(:version => 20130125160237) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "ndc_code"
    t.string   "ndc_name"
    t.string   "rxnorm_code"
    t.string   "rxnorm_name"
    t.string   "dose_amount"
    t.string   "dose_unit"
  end

  create_table "fulfillments", :force => true do |t|
    t.datetime "when_filled"
    t.string   "quantity_unit"
    t.decimal  "quantity_amount"
    t.integer  "prescription_id"
    t.integer  "pharmacist_id"
    t.integer  "pharmacy_id"
    t.string   "fill_status"
    t.string   "prescription_number"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "family_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sex_id"
    t.string   "given_name"
    t.string   "title"
    t.date     "birthdate"
    t.integer  "address_id"
    t.string   "phone"
  end

  create_table "pharmacies", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prescriptions", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "prescriber_id"
    t.integer  "drug_id"
    t.datetime "when_written"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "free_text_sig"
    t.datetime "effective_start"
    t.datetime "effective_end"
    t.string   "order_number"
    t.integer  "fills_count"
    t.decimal  "quantity_amount"
    t.string   "quantity_units"
    t.datetime "expiration"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "sexes", :force => true do |t|
    t.string   "code"
    t.string   "display_name"
    t.string   "original_text"
    t.string   "code_system"
    t.string   "code_system_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
