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

ActiveRecord::Schema.define(:version => 20110711084828) do

  create_table "employees", :force => true do |t|
    t.string   "employee_name"
    t.date     "doj"
    t.date     "salary_calculation_date"
    t.date     "confirmation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dol"
    t.string   "status"
    t.string   "refno"
  end

  create_table "leave_avails", :force => true do |t|
    t.string   "employee_name"
    t.string   "leave_name"
    t.date     "leaveDate"
    t.string   "leaveTakenDayPeriod"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leave_avails", ["employee_name"], :name => "index_leave_avails_on_employee_name"
  add_index "leave_avails", ["leave_name"], :name => "index_leave_avails_on_leave_name"

  create_table "leave_definitions", :force => true do |t|
    t.string   "leave_name"
    t.boolean  "allotment"
    t.boolean  "affect_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
