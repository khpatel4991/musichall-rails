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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160419025411) do

  create_table "artist_aliases", force: :cascade do |t|
    t.integer "artistId",    limit: 4,   default: 0, null: false
    t.string  "artistAlias", limit: 200,             null: false
  end

  add_index "artist_aliases", ["artistAlias"], name: "artistAlias", using: :btree
  add_index "artist_aliases", ["artistId", "artistAlias"], name: "artistId", unique: true, using: :btree

  create_table "artists", force: :cascade do |t|
    t.string  "artistName",             limit: 200
    t.integer "artistPopularityAll",    limit: 4
    t.integer "artistPopularityRecent", limit: 4
  end

  add_index "artists", ["artistName"], name: "artistName", using: :btree
  add_index "artists", ["artistPopularityAll"], name: "artistPopularityAll", using: :btree
  add_index "artists", ["artistPopularityRecent"], name: "artistPopularityRecent", using: :btree

  create_table "genres", force: :cascade do |t|
    t.integer "level",   limit: 4,  null: false
    t.string  "name",    limit: 30, null: false
    t.integer "song_id", limit: 4
  end

  add_index "genres", ["name"], name: "name", using: :btree
  add_index "genres", ["song_id"], name: "songId", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string  "youtubeId",     limit: 100, null: false
    t.integer "artist_id",     limit: 4
    t.string  "songName",      limit: 150
    t.string  "youtubeName",   limit: 350
    t.string  "url",           limit: 255
    t.integer "releaseDate",   limit: 4
    t.integer "decade",        limit: 4
    t.date    "youtubeDate"
    t.date    "crawlDate"
    t.integer "viewCount",     limit: 4
    t.integer "crawlDelta",    limit: 4
    t.float   "rating",        limit: 24
    t.float   "viewCountRate", limit: 24
    t.string  "duration",      limit: 40
    t.string  "songLanguage",  limit: 40,  null: false
    t.string  "songCountry",   limit: 40,  null: false
  end

  add_index "songs", ["artist_id"], name: "artistId", using: :btree
  add_index "songs", ["crawlDelta"], name: "crawlDelta", using: :btree
  add_index "songs", ["songCountry"], name: "songCountry", using: :btree
  add_index "songs", ["songLanguage"], name: "songLanguage", using: :btree
  add_index "songs", ["songName"], name: "songName", using: :btree
  add_index "songs", ["viewCount"], name: "viewCount", using: :btree
  add_index "songs", ["viewCountRate"], name: "viewCountRate", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "genres", "songs", name: "genres_ibfk_1"
  add_foreign_key "songs", "artists", name: "songs_ibfk_1"
end
