require 'spec_helper'

describe LeaveAvail do

  describe "validation" do
    before do
      @la = LeaveAvail.new
      @la.should_not be_valid
    end

    [:employee_name, :leave_name, :leaveDate, :leaveTakenDayPeriod].each do |attr|
      it "should have #{attr}" do
        @la.errors[attr].should_not be_nil
      end
    end
  end

  describe "Association" do
    it 'belongs to a employee' do
      LeaveAvail.new.should respond_to(:employee)
    end

    it 'belongs to a leave' do
      LeaveAvail.new.should respond_to(:leave_definition)
    end

    it "can retrieve an employee name and that is an Employee objects" do
      la = Factory(:leave_avail)
      la.employee_name.should_not be_nil
      la.employee_name.should be_kind_of(Employee)
    end
  end

end
