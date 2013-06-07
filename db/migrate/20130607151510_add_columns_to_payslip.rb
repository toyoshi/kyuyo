class AddColumnsToPayslip < ActiveRecord::Migration
  def change
    add_column :payslips, :outworking_time, :string
    add_column :payslips, :allow_1_label, :string
    add_column :payslips, :allow_1, :integer
    add_column :payslips, :allow_2_label, :stirng
    add_column :payslips, :allow_2, :integer
    add_column :payslips, :allow_3_label, :string
    add_column :payslips, :allow_3, :integer
    add_column :payslips, :allow_4_label, :string
    add_column :payslips, :allow_4, :integer
    add_column :payslips, :allow_5_label, :string
    add_column :payslips, :allow_5, :integer
    add_column :payslips, :residents_tax, :integer
    add_column :payslips, :health_insurance, :integer
    add_column :payslips, :welfare_pension, :integer
    add_column :payslips, :unemployment_insurance, :integer
    add_column :payslips, :deduction_1_label, :string
    add_column :payslips, :deduction_1, :integer
    add_column :payslips, :deduction_2_label, :string
    add_column :payslips, :deduction_2, :integer
    add_column :payslips, :deduction_3_label, :string
    add_column :payslips, :deduction_3, :integer
  end
end
