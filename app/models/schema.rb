ActiveRecord::Schema.define(version: 2023_03_09_001122) do

    create_table "bookings", force: :cascade do |t|
      t.integer "user_id"
      t.integer "room_id"
      t.date "check_in_date"
      t.date "check_out_date"
      t.integer "guest_count"
      t.boolean "confirmed", default: false
      t.timestamps null: false
      t.index ["user_id"], name: "index_bookings_on_user_id"
      t.index ["room_id"], name: "index_bookings_on_room_id"
    end
  
    create_table "rooms", force: :cascade do |t|
      t.string "name"
      t.text "description"
      t.string "image_url"
      t.decimal "price_per_night", precision: 10, scale: 2
      t.integer "capacity"
      t.integer "bed_count"
      t.timestamps null: false
    end
  
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.boolean "admin", default: false
      t.timestamps null: false
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  
  end
  