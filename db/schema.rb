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

ActiveRecord::Schema.define(:version => 20130604020352) do

  create_table "payslips", :force => true do |t|
    t.date     "payslip_date"
    t.string   "name"
    t.date     "work_from"
    t.date     "work_to"
    t.integer  "working_days"
    t.time     "working_time"
    t.integer  "basic_pay"
    t.integer  "transportation_expenses"
    t.integer  "income_tax"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
