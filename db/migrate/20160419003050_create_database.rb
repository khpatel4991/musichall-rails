class CreateDatabase < ActiveRecord::Migration
  def change
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
      t.integer "level",  limit: 4,   null: false
      t.string  "name",   limit: 30,  null: false
      t.string  "songId", limit: 200, null: false
    end

    add_index "genres", ["name"], name: "name", using: :btree
    add_index "genres", ["songId"], name: "songId", using: :btree

    create_table "songs", primary_key: "youtubeId", force: :cascade do |t|
      t.integer "artistId",      limit: 4,   null: false
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

    add_index "songs", ["artistId"], name: "artistId", using: :btree
    add_index "songs", ["crawlDelta"], name: "crawlDelta", using: :btree
    add_index "songs", ["songCountry"], name: "songCountry", using: :btree
    add_index "songs", ["songLanguage"], name: "songLanguage", using: :btree
    add_index "songs", ["songName"], name: "songName", using: :btree
    add_index "songs", ["viewCount"], name: "viewCount", using: :btree
    add_index "songs", ["viewCountRate"], name: "viewCountRate", using: :btree

    add_foreign_key "artist_aliases", "artists", column: "artistId", name: "artist_aliases_ibfk_1"
    add_foreign_key "genres", "songs", column: "songId", primary_key: "youtubeId", name: "genres_ibfk_1"
    add_foreign_key "songs", "artists", column: "artistId", name: "songs_ibfk_1"
  end
end
