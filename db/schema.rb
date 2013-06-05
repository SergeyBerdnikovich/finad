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

ActiveRecord::Schema.define(:version => 20130605123954) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "adviser_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "adviser_users", ["confirmation_token"], :name => "index_adviser_users_on_confirmation_token", :unique => true
  add_index "adviser_users", ["email"], :name => "index_adviser_users_on_email", :unique => true
  add_index "adviser_users", ["reset_password_token"], :name => "index_adviser_users_on_reset_password_token", :unique => true

  create_table "advisers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "url"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "adviser_user_id"
    t.string   "plan"
    t.text     "bio"
    t.string   "url1"
    t.string   "email"
    t.string   "slug"
    t.boolean  "featured"
    t.integer  "rating_id"
    t.string   "blog_url"
    t.boolean  "verified"
    t.text     "education"
    t.integer  "years_of_experience"
    t.text     "short_description"
    t.text     "company_data"
    t.string   "offers_and_pledges"
    t.string   "compensation_arrangements"
    t.string   "experience"
  end

  add_index "advisers", ["address"], :name => "index_advisers_on_address"
  add_index "advisers", ["adviser_user_id"], :name => "index_advisers_on_adviser_user_id"
  add_index "advisers", ["featured"], :name => "index_advisers_on_featured"
  add_index "advisers", ["name"], :name => "index_advisers_on_name"
  add_index "advisers", ["rating_id"], :name => "index_advisers_on_rating_id"
  add_index "advisers", ["slug"], :name => "index_advisers_on_slug", :unique => true
  add_index "advisers", ["zip"], :name => "index_advisers_on_zip"

  create_table "advisers_questions", :force => true do |t|
    t.integer  "adviser_id"
    t.integer  "question_id"
    t.text     "answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "complaints", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "contact_time"
    t.string   "adviser_name"
    t.string   "adviser_phone"
    t.text     "complain"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "adviser_id"
  end

  create_table "counters", :force => true do |t|
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "adviser_id"
  end

  add_index "galleries", ["adviser_id"], :name => "index_galleries_on_adviser_id"

  create_table "impressions", :force => true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], :name => "impressionable_type_message_index", :length => {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "office_hours", :force => true do |t|
    t.string   "day_of_the_week"
    t.time     "start"
    t.time     "end"
    t.integer  "adviser_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "office_hours", ["adviser_id"], :name => "index_office_hours_on_adviser_id"

  create_table "questions", :force => true do |t|
    t.text     "body"
    t.boolean  "faq"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.integer  "adviser_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "info"
    t.string   "service"
    t.string   "portfolio"
    t.integer  "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "hashstr"
  end

  create_table "verifications", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "adviser_id"
    t.integer  "adviser_user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
