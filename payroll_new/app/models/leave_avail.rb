class LeaveAvail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leave_definition

  validates_presence_of :employee_name, :leave_name, :leaveDate, :leaveTakenDayPeriod

end
