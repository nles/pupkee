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

ActiveRecord::Schema.define(:version => 20130217102044) do
  enable_extension "plpgsql"

  create_table "contacts", :force => true do |t|
    t.date     "date"
    t.text     "details"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "contacts", ["customer_id"], :name => "index_contacts_on_customer_id"

  create_table "contacts_tasks", :id => false, :force => true do |t|
    t.integer "task_id"
    t.integer "contact_id"
  end

  add_index "contacts_tasks", ["contact_id", "task_id"], :name => "index_contacts_tasks_on_contact_id_and_task_id"
  add_index "contacts_tasks", ["task_id", "contact_id"], :name => "index_contacts_tasks_on_task_id_and_contact_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "town"
    t.string   "address"
    t.text     "details"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "customers_services", :id => false, :force => true do |t|
    t.integer "service_id"
    t.integer "customer_id"
  end

  add_index "customers_services", ["customer_id", "service_id"], :name => "index_customers_services_on_customer_id_and_service_id"
  add_index "customers_services", ["service_id", "customer_id"], :name => "index_customers_services_on_service_id_and_customer_id"

  create_table "documentations", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "efforts", :force => true do |t|
    t.text     "description"
    t.datetime "from"
    t.datetime "to"
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "paid_at"
  end

  add_index "efforts", ["task_id"], :name => "index_efforts_on_task_id"
  add_index "efforts", ["user_id"], :name => "index_efforts_on_user_id"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.date     "deadline"
    t.text     "details"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.boolean  "done",                     :default => false
    t.integer  "billed",      :limit => 1, :default => 0
    t.integer  "customer_id"
    t.integer  "flag",        :limit => 4, :default => 0
  end

  create_table "tasks_users", :id => false, :force => true do |t|
    t.integer "task_id"
    t.integer "user_id"
  end

  add_index "tasks_users", ["task_id", "user_id"], :name => "index_tasks_users_on_task_id_and_user_id"
  add_index "tasks_users", ["user_id", "task_id"], :name => "index_tasks_users_on_user_id_and_task_id"

  create_table "users", :force => true do |t|
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
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
