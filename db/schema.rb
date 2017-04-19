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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170419112327) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "title"
    t.text    "description", limit: 65535
    t.integer "posts_count",               default: 0
  end

  create_table "meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name"
    t.string  "metaable_type"
    t.integer "metaable_id"
    t.index ["metaable_type", "metaable_id"], name: "index_meta_on_metaable_type_and_metaable_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "content",      limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "slug"
    t.boolean  "online",                     default: false
    t.integer  "categorie_id"
    t.index ["categorie_id"], name: "index_posts_on_categorie_id", using: :btree
  end

  create_table "posts_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
    t.index ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", using: :btree
    t.index ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  add_foreign_key "posts", "categories", column: "categorie_id"
end
