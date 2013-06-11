ActiveRecord::Schema.define(:version => 20130605204726) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genres", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "video_link"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "lessons", :force => true do |t|
    t.string   "group"
    t.date     "day_of_week"
    t.time     "time"
    t.integer  "price"
    t.integer  "teacher_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "photos", :force => true do |t|
    t.text     "description"
    t.string   "photo"
    t.integer  "attachable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "teacher_id"
  end

  add_index "photos", ["attachable_id"], :name => "index_photos_on_attachable_id"

  create_table "teacher_photos", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "teacher_id"
  end

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "description"
    t.string   "motto"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "photo"
  end

end
