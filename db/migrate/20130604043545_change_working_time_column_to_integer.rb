class ChangeWorkingTimeColumnToInteger < ActiveRecord::Migration
  def change 
    change_column :payslips, :working_time, :string
  end
end
