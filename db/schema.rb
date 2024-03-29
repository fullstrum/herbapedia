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

ActiveRecord::Schema.define(:version => 20130403024134) do

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

  create_table "cosmetics", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cosmetics_recipes", :id => false, :force => true do |t|
    t.integer "cosmetic_id"
    t.integer "recipe_id"
  end

  create_table "culinaries", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "culinaries_recipes", :id => false, :force => true do |t|
    t.integer "culinary_id"
    t.integer "recipe_id"
  end

  create_table "folk_uses", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "folk_uses_recipes", :id => false, :force => true do |t|
    t.integer "folk_use_id"
    t.integer "recipe_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups_regions", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "region_id"
  end

  create_table "herb_names", :force => true do |t|
    t.string   "name",                             :null => false
    t.integer  "herb_id",                          :null => false
    t.string   "pronunciation"
    t.integer  "name_type_id",                     :null => false
    t.boolean  "primary",       :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "herbs", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "history"
    t.string   "family"
    t.text     "cultivation"
    t.text     "toxicity"
    t.text     "constituents"
  end

  create_table "herbs_properties", :id => false, :force => true do |t|
    t.integer "herb_id"
    t.integer "property_id"
  end

  create_table "herbs_regions", :id => false, :force => true do |t|
    t.integer "herb_id"
    t.integer "region_id"
  end

  create_table "households", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "item"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medicinals", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medicinals_recipes", :id => false, :force => true do |t|
    t.integer "medicinal_id"
    t.integer "recipe_id"
  end

  create_table "name_types", :force => true do |t|
    t.string   "name_type",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "other_uses", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "herb_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "other_uses_recipes", :id => false, :force => true do |t|
    t.integer "other_use_id"
    t.integer "recipe_id"
  end

  create_table "properties", :force => true do |t|
    t.string   "property_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.string   "quantity"
    t.string   "measure"
    t.string   "prep_notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
  end

  create_table "recipes", :force => true do |t|
    t.text     "directions"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "region_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_groups", ["user_id", "group_id"], :name => "index_user_groups_on_user_id_and_group_id", :unique => true
  add_index "user_groups", ["user_id"], :name => "index_user_groups_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
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
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
