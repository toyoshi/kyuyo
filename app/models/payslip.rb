class Payslip < ActiveRecord::Base
  attr_accessible :basic_pay, :income_tax, :name, :payslip_date, :transportation_expenses, :work_from, :work_to, :working_days, :working_time

  def allowanance_amount
    basic_pay + transportation_expenses
  end

  def deduction_amount
    income_tax
  end

  def balance
    allowanance_amount - deduction_amount
  end
end
