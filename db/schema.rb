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

ActiveRecord::Schema.define(:version => 20130607151510) do

  create_table "payslips", :force => true do |t|
    t.date     "payslip_date"
    t.string   "name"
    t.date     "work_from"
    t.date     "work_to"
    t.integer  "working_days"
    t.string   "working_time"
    t.integer  "basic_pay"
    t.integer  "transportation_expenses"
    t.integer  "income_tax"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "outworking_time"
    t.string   "allow_1_label"
    t.integer  "allow_1"
    t.string   "allow_2_label"
    t.integer  "allow_2"
    t.string   "allow_3_label"
    t.integer  "allow_3"
    t.string   "allow_4_label"
    t.integer  "allow_4"
    t.string   "allow_5_label"
    t.integer  "allow_5"
    t.integer  "residents_tax"
    t.integer  "health_insurance"
    t.integer  "welfare_pension"
    t.integer  "unemployment_insurance"
    t.string   "deduction_1_label"
    t.integer  "deduction_1"
    t.string   "deduction_2_label"
    t.integer  "deduction_2"
    t.string   "deduction_3_label"
    t.integer  "deduction_3"
  end

end
