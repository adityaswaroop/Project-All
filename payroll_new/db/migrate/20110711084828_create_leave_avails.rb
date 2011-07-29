class CreateLeaveAvails < ActiveRecord::Migration
  def self.up
    create_table :leave_avails do |t|
      t.string :employee_name
      t.string :leave_name
      t.date :leaveDate
      t.string :leaveTakenDayPeriod

      t.timestamps
    end
    add_index :leave_avails, :employee_name
    add_index :leave_avails, :leave_name
  end

  def self.down
    drop_table :leave_avails
  end
end
