class CreatePayslips < ActiveRecord::Migration
  def change
    create_table :payslips do |t|
      t.date :payslip_date
      t.string :name
      t.date :work_from
      t.date :work_to
      t.integer :working_days
      t.time :working_time
      t.integer :basic_pay
      t.integer :transportation_expenses
      t.integer :income_tax

      t.timestamps
    end
  end
end
