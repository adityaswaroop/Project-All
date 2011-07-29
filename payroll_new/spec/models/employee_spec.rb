require 'spec_helper'


describe Employee do

  describe "Validation" do

    before(:each) do
      @valid_attribute = {
          :employee_name => "Aditya Swaroop",
          :doj => "2011-01-01"
      }
    end

    subject {Factory.build :employee}

    it "should create new instance of employee with given valid attributes" do
        lambda {
          Employee.create(@valid_attribute)
        }.should change(Employee,:count).by(1)
      end


#    [:employee_name, :doj].each do |attr|
#      it "should have #{attr}" do
#        emp = Employee.new
#        emp.should_not be_valid
#        emp.errors[attr].should_not be_nil
#      end
#    end

    # instead of above test new test is below
    [:employee_name, :doj].each do |attr|
      it "should have #{attr}" do
        subject.send("#{attr}=", nil)
        should_not be_valid  # uses implicit subject {Employee}
        subject.errors[attr].should_not be_nil
      end
    end

#    it "should check employee status" do
#      emp = Employee.create(@valid_attribute)
#      emp.dol.should be_nil
#      emp.save
#      emp.status.should == "Active"
#    end


    it "can make a employee from a factory" do
      emp = Factory(:employee)
      emp.should_not be_nil
      emp.should be_kind_of(Employee)
    end

    it "should search reference no of employee with partial match" do
      emp1 = Factory(:employee, :employee_name => "John Smith", :refno => "A0001")
      emp2 = Factory(:employee, :employee_name => "Peter Walton", :refno => "A0002")
      emp3 = Factory(:employee, :employee_name => "Shane Lee", :refno => "B0001")

      Employee.all.should == [emp1,emp2,emp3]

      Employee.find_by_ref_starting_with("A00").should == [emp1,emp2]
    end

  end

  describe "Association" do

    it "has many leave avail" do
      Employee.new.should respond_to(:leave_avail)
    end

    it "can retrieve leave avails" do
      lv_avail = Factory(:leave_avail)
      p = lv_avail.employee_name
      p.leave_avail.should == [lv_avail]
    end

  end

end









