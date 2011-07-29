# By using the symbol ':employee', we get Factory Girl to simulate the Employee model.
Factory.define :employee do |emp|
  emp.employee_name "Aditya Swaroop"
  emp.doj "2011-01-01"
  emp.salary_calculation_date "2011-01-01"
  emp.confirmation_date "2011-04-01"
  emp.dol "NULL"
end

Factory.define :leave_definition do |leave|
  leave.leave_name "EL"
end

Factory.define :leave_avail do |l|
  l.association :employee_name, :factory => :employee
  l.association :leave_name, :factory => :leave_definition
  l.leaveDate "2011/07/15"
  l.leaveTakenDayPeriod "Both"
end