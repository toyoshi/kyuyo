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
      page.values(self.attributes.select {|k, v| page.item_exists?(k) })
      page.values(allowanance_amount: allowanance_amount, 
                  deduction_amount: deduction_amount, 
                  balance: balance)
    end
    reports.generate
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      payslip = new
      attributes_hash.each do |key, value|
        next if row[value].nil?
        if row[value].class == Date
          row[value] = row[value].strftime('%Y-%m-%d')
        end
        payslip.send("#{key}=", row[value])
      end
      payslip
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.attributes_hash
    {
        basic_pay: '基本給' ,
        income_tax: '所得税' ,
        name: '氏名' ,
        payslip_date: '発行年月',
        transportation_expenses: '非課税通勤費',
        work_from: '労働開始日',
        work_to: '労働終了日' ,
        working_days: '労働日数' ,
        working_time: '労働時間' ,
        allow_1: '支給額1' ,
        allow_1_label: '支給額1名称' ,
        allow_2: '支給額2' ,
        allow_2_label: '支給額2名称' ,
        allow_3: '支給額3' ,
        allow_3_label: '支給額3名称' ,
        allow_4: '支給額4' ,
        allow_4_label: '支給額4名称' ,
        allow_5: '支給額5' ,
        allow_5_label: '支給額5名称' ,
        deduction_1: '控除額1' ,
        deduction_1_label: '控除額1名称',
        deduction_2: '控除額2' ,
        deduction_2_label: '控除額2名称',
        deduction_3: '控除額3' ,
        deduction_3_label: '控除額3名称',
        health_insurance: '健康保険' ,
        outworking_time: '所定時間外労働',
        residents_tax: '住民税',
        unemployment_insurance: '雇用保険',
        welfare_pension: '厚生年金',
    }
  end
end
