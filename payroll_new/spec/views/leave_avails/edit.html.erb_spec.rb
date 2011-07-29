require 'spec_helper'

describe "leave_avails/edit.html.erb" do
  before(:each) do
    @leave_avail = assign(:leave_avail, stub_model(LeaveAvail,
      :empID => 1,
      :leaveID => 1,
      :leaveTakenDayPeriod => "MyString"
    ))
  end

  it "renders the edit leave_avail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_avails_path(@leave_avail), :method => "post" do
      assert_select "input#leave_avail_empID", :name => "leave_avail[empID]"
      assert_select "input#leave_avail_leaveID", :name => "leave_avail[leaveID]"
      assert_select "input#leave_avail_leaveTakenDayPeriod", :name => "leave_avail[leaveTakenDayPeriod]"
    end
  end
end
