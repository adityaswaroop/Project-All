require 'spec_helper'

describe LeaveDefinition do

  before(:each) do
    @valid_attribute = {
        :leave_name => "EL",
        :allotment => false,
        :affect_salary => false
    }
  end

  it "should create new instance of leave with given valid attributes" do
      lambda {
        LeaveDefinition.create(@valid_attribute)
      }.should change(LeaveDefinition,:count).by(1)
    end

  it "should have the leave name" do
    lambda {
      LeaveDefinition.create(:leave_name => '', :allotment => 'true', :affect_salary => 'true')
    }.should_not change(LeaveDefinition, :count)
  end


end
