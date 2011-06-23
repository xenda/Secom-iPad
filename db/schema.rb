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

ActiveRecord::Schema.define(:version => 20110622204503) do

  create_table "articulos", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.integer  "sector_id"
    t.integer  "clase_id"
    t.integer  "user_id"
    t.boolean  "publicado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "categoria_id"
    t.boolean  "revisado"
    t.string   "firma"
    t.integer  "edicion_id"
    t.integer  "seccion_id"
    t.integer  "orden"
    t.string   "slug"
    t.text     "resumen"
    t.boolean  "delta",                 :default => true,  :null => false
    t.boolean  "al_home"
    t.boolean  "promocionar",           :default => false
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.datetime "fb_image_updated_at"
    t.integer  "fb_image_file_size"
    t.boolean  "delay_twitter"
    t.boolean  "delay_facebook"
    t.datetime "delayed_till"
    t.boolean  "delay_finished"
    t.integer  "page_number"
    t.string   "banner_file_name"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "banner_content_type"
  end

  add_index "articulos", ["categoria_id"], :name => "index_articulos_on_categoria_id"
  add_index "articulos", ["clase_id"], :name => "index_articulos_on_clase_id"
  add_index "articulos", ["edicion_id"], :name => "index_articulos_on_edicion_id"
  add_index "articulos", ["publicado"], :name => "publicado"
  add_index "articulos", ["seccion_id"], :name => "index_articulos_on_seccion_id"
  add_index "articulos", ["sector_id"], :name => "index_articulos_on_sector_id"
  add_index "articulos", ["type"], :name => "index_articulos_on_type"
  add_index "articulos", ["user_id"], :name => "index_articulos_on_user_id"

  create_table "clases", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ediciones", :force => true do |t|
    t.integer  "numero"
    t.string   "titulo"
    t.boolean  "publicado"
    t.date     "fecha"
    t.string   "caricatura"
    t.string   "caratula1"
    t.string   "caratula2"
    t.string   "texto"
    t.string   "especial"
    t.string   "informe"
    t.string   "infespecial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issuu_id"
    t.string   "especial_issuu_id"
    t.text     "especial_texto"
    t.boolean  "ipad_enabled",      :default => false
  end

  create_table "secciones", :force => true do |t|
    t.string   "nombre"
    t.string   "slug"
    t.boolean  "desplegar"
    t.boolean  "menu"
    t.integer  "orden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo"
  end

  create_table "section_images", :force => true do |t|
    t.integer  "edicion_id"
    t.integer  "seccion_id"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.datetime "banner_updated_at"
    t.integer  "banner_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
