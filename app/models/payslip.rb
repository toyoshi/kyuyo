class Payslip < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
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

  def to_pdf
    reports = ThinReports::Report.new layout: File.join(Rails.root , 'app', 'reports', 'basic')
    reports.start_new_page do |page|
      page.item(:name).value(self.name)
      page.item(:payslip_date).value(self.payslip_date.strftime("%Y年%m月"))

      %w(work_from work_to).each do |key|
        page.item(key.to_sym).value(self.send(key).strftime("%Y年%m月%d日"))
      end

      %w(working_days working_time).each do |key|
        page.item(key.to_sym).value(self.send(key))
      end

      %w(basic_pay transportation_expenses income_tax allowanance_amount deduction_amount balance).each do |key|
        page.item(key.to_sym).value("#{number_with_delimiter(self.send(key))}円")
      end
    end
    reports.generate
  end
end
