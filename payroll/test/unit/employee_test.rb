require 'test_helper'


class EmployeeTest < ActiveSupport::TestCase
  setup do
    @employee = Employee.new
  end

  test "should not save employee without employee name" do

#    assert !@employee.save, "Save the employee without employee name"

    @emp = employees(:one)
    assert !@emp.valid?
    assert @emp.errors.on(:empname)
    assert !@emp.save
  end

#  test "should check whether employee is intact with company" do
#    @employee.employee_name = "Aditya Swaroop"
#    @employee.date_of_joining = "01/01/2010"
#    @employee.date_of_leaving = NULL
#  end
#
#  test "should check whether employee is in Probation Period" do
#    @employee.employee_name = "Aditya Swaroop"
#    @employee.date_of_joining = "01/01/2010"
#    @employee.confirmation_date = "15/04/2010"
#
#
#  end

end
