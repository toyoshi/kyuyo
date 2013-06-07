class Payslip < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  attr_accessible :basic_pay, :income_tax, :name, :payslip_date, :transportation_expenses, :work_from, :work_to, :working_days, :working_time
  attr_accessible :allow_1, :allow_2, :allow_3, :allow_4, :allow_5, :outworking_time, :allow_1_label, :allow_2_label, :allow_3_label, :allow_4_label, :allow_5_label, :residents_tax, :health_insurance, :welfare_pension, :unemployment_insurance, :deduction_1_label, :deduction_1, :deduction_2_label, :deduction_2, :deduction_3_label, :deduction_3
  def allowanance_amount
    basic_pay.to_i + transportation_expenses.to_i + allow_1.to_i + allow_2.to_i + allow_3.to_i + allow_4.to_i + allow_5.to_i
  end

  def deduction_amount
    income_tax.to_i + deduction_1.to_i + deduction_2.to_i + deduction_3.to_i + unemployment_insurance.to_i + welfare_pension.to_i + health_insurance.to_i + residents_tax.to_i
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

      %w(working_days working_time outworking_time allow_1_label allow_2_label allow_3_label allow_4_label allow_5_label deduction_1_label deduction_2_label deduction_3_label).each do |key|
        page.item(key.to_sym).value(self.send(key))
      end

      %w(basic_pay transportation_expenses income_tax allowanance_amount deduction_amount balance allow_1 allow_2 allow_3 allow_4 allow_5 deduction_1 deduction_2 deduction_3 unemployment_insurance welfare_pension health_insurance residents_tax).each do |key|
        page.item(key.to_sym).value("#{number_with_delimiter(self.send(key))}円")
      end
    end
    reports.generate
  end
end
