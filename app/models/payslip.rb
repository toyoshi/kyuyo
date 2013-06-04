class Payslip < ActiveRecord::Base
  attr_accessible :basic_pay, :income_tax, :name, :payslip_date, :transportation_expenses, :work_from, :work_to, :working_days, :working_time
end
